WebPageController
=================

Every now and then a hosting customer emails us and asks the same question:

“When should I use multiple webpages vs multiple containers in a single webpage?”

You would think it would be obvious. Of course like many things with Xojo it is not. At present the web framework doesn’t seem to make any distinction between web pages and containers. If you use implicit instances of your webpages it just loads the default page you selected when a Session is created. From that point forward a webpage and a container are nearly identical. The only difference is how you go about calling/embedding them. 

One glaring problem with webpages not being special is they are not treated as traditional webpages. When the web was created it was created a series of documents (initially only HTML). You moved between documents by setting the URL in your browser. To navigate from page1.html to page2.html you just requested page2.html and the server served the page2.html sitting on the servers filesystem. 

With Xojo webpages are not individual pages sitting on the server’s filesystem. They are just a container of controls in Javascript. This means you can’t navigate between webpages with a URL. 

In a recent project it became clear we needed the ability to load a specific page. Specifically for oAuth purposes. If a user needs to grant our application access to post to Twitter for example on their behalf we have to forward them to Twitter to acquire the necessary tokens. On the way back from Twitter the user is forced to log back into the application and lost all continuity between their previous and current session (never mind its an entirely new session!). This is was not a desired user experience. We want the user to dig into the menus, select “Authorize Twitter”, be taken to Twitter, then return exactly where they left off as if nothing had happened.

The first step of that is enabling Xojo to understand the distinction between webpages. Make them a first class citizen like traditional webpages. We are introducing the WebPageController class. It’s purpose is to create a high level abstraction of moving between webpages in your web application. You no longer hide/show webpages. You simply add instances of them to the controller, then ask the controller to load a specific webpage when you need it. Your session’s HashTagChanged event can also do this so you can navigate to specific pages just by using a hashtag.
