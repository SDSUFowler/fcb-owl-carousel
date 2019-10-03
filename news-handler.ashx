// This file will typically be found in /_resources/cs/.

// Look for "switch (displayMethod)" and add the following snippet to the list of cases:
case "displayNewsFullWidth":
  output = OUC.WnlDisplayMethods.displayNewsFullWidth(rssUri, categoryFilters, rssXPath, numberToDisplay);
  break;
  
// Look for "public static class WnlDisplayMethods" and add the following snippet to the list of methods:

/* method: displayNewsFullWidth */
/* Full width carousel of news items */
public static string displayNewsFullWidth(string _url, string filter, string _xpath, int _qty)
{
  string response = "";
  try {
    OuMediaRss rss = new OuMediaRss(_url, _xpath);
    rss = filterByCategories(rss, filter);

    string rssTitle = rss.doc.XPathSelectElement("/rss/channel/title").Value;

    string noFeedMsg = "No items to display for this feed.";

    response += "<div class=\"news-slider-full-width\" id=\"news-slider-full-width\">";

    foreach (var i in rss.MediaRssItems.Take(_qty)) {

      response += "<div><a title=\"" + i.mdescription + "\" href=\"" + i.link + "\">";
      if(i.hasMedia){
        response += "<img title=\"" + i.mdescription + "\" src=\"" + i.murl + "\" alt=\"" + i.mdescription + "\" width=\"351\" height=\"198\" />";
      }
      response += "<h4>" + i.title + "</h4></a>";
      response += "<p>" + i.description + "</p>";
      response += "</div>";
    }

    if(rss.MediaRssItems.Count() == 0){
      response += "<div class=\"no-feed-result\">" + noFeedMsg + "</div>";
    }

    response += "</div>";
  } catch (WebException e) {
    //response = e.ToString(); // Uncomment if you want to display the actual error
    response = "News cannot be displayed at this time. Please try again later.";
  } catch (UriFormatException e) {
    response = "Invalid URL: News cannot be displayed at this time. Please try again later.";
  }

  return response;
}
