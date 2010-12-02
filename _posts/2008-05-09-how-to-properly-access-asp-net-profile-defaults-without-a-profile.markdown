--- 
wordpress_id: 386
layout: post
title: How to properly access ASP.NET profile defaults without a profile
wordpress_url: /code/how-to-properly-access-asp-net-profile-defaults-without-a-profile/
---

<p>Recently, we stumbled upon this indiscrete bug in Community Server with its handling of some things in a user's profile.  While debugging, couldn't find much about it on Google, so I thought I'd write up a quick explanation so it might help spare some poor sole from losing hair over it.</p>
<p>In summary of it, there were some edge cases where a user record could exist, but they didn't have a profile record yet (created externally, or for me, created via REST API with none of the profile options set).  When a profile record isn't found, then CS just reads the default values as defined in your web.config.</p>
<p>The documentation on how to do this is quite slim, so in our profile handling, we basically had this method:</p>
<pre class="brush: c-sharp;">
public override object GetPropertyValue(string propertyKey)
{
  return ProfileBase.Properties[propertyKey].DefaultValue;
}</pre>
<p><a href="http://msdn.microsoft.com/en-us/library/system.configuration.settingsproperty.defaultvalue.aspx">DefaultValue</a> returns an object, and as the documentation states:</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<blockquote>An object containing the default value of the SettingsProperty object.</blockquote>
<p>&nbsp;</p>
<p>So when you had a profile entry as so:</p>
<pre class="brush: xml;">&lt;properties&gt;
  ...
  &lt;add name = &quot;timezone&quot; type = &quot;System.Double&quot; defaultValue=&quot;0&quot; /&gt;
  ...
&lt;/properties&gt;</pre>
<p>You might assume that when you get the timezone default value, you get a  double back.  Right?  Wrong!  Even though DefaultValue returns an object, the actual return value is <b>always a string</b>.  The documentation isn't misleading, it is just rather bare.  In our case, we expected it to be a double and would get an invalid casting exception (the bug in CS wasn't for the timezone setting, it was a different one).</p>
<p>So how do you properly read the default value and get the expected type?  Documentation on this is bare as well, but after sifting through Reflector some, found that other places DefaultValue is accessed also make use of a SettingsPropertyValue class.  Aha!  The SettingsPropertyValue class is used to perform the serialization on the default value.  So for the above, you could quickly fix it like so:</p>
<pre class="brush: c-sharp;">public override object GetPropertyValue(string propertyKey)
{
  return new SettingsPropertyValue(ProfileBase.Properties[propertyKey]).PropertyValue;
}</pre>
<p>Wha-la!  Magic!  Also to help illustrate it better, can throw this snippet into a .aspx page and run it in your browser.  It will spit out a quick list of all your profile properties and their values/type using both methods.</p>
<pre class="brush: xml;">&lt;%@ Page Language=&quot;C#&quot; AutoEventWireup=&quot;true&quot; %&gt;
&lt;script runat=&quot;server&quot;&gt;
	public void Page_Load(object sender, EventArgs e)
	{
		Response.Write(&quot;&lt;table border='1' cellpadding='3'&gt;&lt;tr&gt;&lt;th&gt;Name&lt;/th&gt;&lt;th&gt;Type&lt;/th&gt;&lt;th&gt;Default Value&lt;/th&gt;&lt;th&gt;Default Value Type&lt;/th&gt;&lt;th&gt;SettingsPropertyValue&lt;/th&gt;&lt;th&gt;SettingsPropertyValue Type&lt;/tr&gt;&quot;);
		foreach (SettingsProperty p in System.Web.Profile.ProfileBase.Properties)
		{
			SettingsPropertyValue spv = new SettingsPropertyValue(p);
			Response.Write( 				string.Format(&quot;&lt;tr&gt;&lt;td&gt;{0}&lt;/td&gt;&lt;td&gt;{1}&lt;/td&gt;&lt;td&gt;{2}&lt;/td&gt;&lt;td&gt;{3}&lt;/td&gt;&lt;td&gt;{4}&lt;/td&gt;&lt;td&gt;{5}&lt;/td&gt;&lt;/tr&gt;&quot;, p.Name, p.PropertyType.FullName, 							p.DefaultValue, p.DefaultValue.GetType().FullName, 							spv.PropertyValue, spv.PropertyValue.GetType().FullName));
		}
		Response.Write(&quot;&lt;/table&gt;&quot;);
	}
&lt;/script&gt;</pre>
<p>If you encounter something similar, may want to take into account how often you might need to access the value, since in the above, it would de-serialize the value each time.  In CS, we actually changed it to lazy-load them and store the value in a dictionary.  We also cleaned up some of the profile code so it was more streamlined and could handle the event it was a string (or something else, such as converting an int timezone into a double).</p>
         
