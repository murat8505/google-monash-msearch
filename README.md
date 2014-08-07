MSearch: A personalised movie search engine
================================
###Author Information

> 
- Name: Weiwei SUN, Monash University
- Mail: ww.sun@outlook.com
- Home: <wwsun.github.com>

###Project Introduction
MSearch is a personalized search engine which integrate with server real world web services. Clients send their requests to the MSearch server, and then the requests will be handled. Based on different request types, requests will make MSearch Server consumes different web services. For example, Alice want to get some relevant images about her favorite movie Inception, he could use the MSearch Image Search service, after type the keywords, the query will be sent to the MSearch server, and then sent to Flickr for requesting the relevant images, that is to say, the actual work is done on the servers in Flickr. The home page of MSearch is shown in Figure 1.

![MSearch Homepage](/img/homepage.png "Figure 1: MSearch homepage")

The system architecture of MSearch is shown in Figure 2. In the center part is MSearch server, which handles the requests form user clients. Five child modules are comprised in MSearch, including Local search for popular movie detail, Image Search integrated with Flickr API, Video Search integrated with YouTube API, Content Search integrated with Google API, and also a simple Sentiment Analysis integrated with Viraheat API. Each function have a counterpart web service provided by different corporations. It is important to note that the Movie Detail is developed by ourselves, consuming the RESTful web service provided by MovieDB Server, all data stored in a MySQL database.

![MSearch arch](/img/arch.png "Figure 2: MSearch architecture")