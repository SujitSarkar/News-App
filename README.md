# News App
This is a newspaper application using the News API from (https://newsapi.org).
This app has many useful features like online and offline reading, bookmark news, user accounts. Users can bookmark any news by creating an account with email and password. This app also has a caching mechanism. When a user reads news in online, the app cache the news so that user can read news even device goes offline.

## Screenshots of News App
| News list screen                               | News Details screen                               |
|------------------------------------------------|---------------------------------------------------|
| ![image info](assets/app_ss/news.png)          | ![image info](assets/app_ss/news_details.png)     |

| Read more screen                               | Bookmark screen                                   |
|------------------------------------------------|---------------------------------------------------|
| ![image info](assets/app_ss/read_more.png)     | ![image info](assets/app_ss/bookmark.png)         |

| Signin screen                                  | Signup screen                                     |
|------------------------------------------------|---------------------------------------------------|
| ![image info](assets/app_ss/signin.png)        | ![image info](assets/app_ss/signup.png)           |

| Account screen                                 | Signin Required                                   |
|------------------------------------------------|---------------------------------------------------|
| ![image info](assets/app_ss/account.png)       | ![image info](assets/app_ss/required_signin.png)  |


## Apk link of News App
You can download the apk file from this (https://drive.google.com/drive/folders/1yd0CohkhcD533DFwkdAOqFRckjQxRtvi?usp=sharing) link.


## Architecture and libraries
Clean architecture has been used to develop this project.<br>
Used libralies and their purposes is given below:

<span style="color:green">google_fonts:</span>           used for text fonts.<br>
<span style="color:green">firebase_auth:</span>          used to integrate firebase authentication.<br>
<span style="color:green">cloud_firestore:</span>        used to integrate firstore database.<br>
<span style="color:green">firebase_core:</span>          used to initialize firstore database.<br>
<span style="color:green">fluttertoast:</span>           for showing toash in the app.<br>
<span style="color:green">dio: </span>                   using to fetch and parse REST API response.<br>
<span style="color:green">get: </span>                   using for state management.<br>
<span style="color:green">feather_icons:</span>          used to integrate icons library into this app.<br>
<span style="color:green">cached_network_image:</span>   for caching network images.<br>
<span style="color:green">intl: </span>                  used to convert the date format as human readable.<br>
<span style="color:green">lottie:</span>                 used to display lottie animations.<br>
<span style="color:green">uuid:</span>                   for generate random unique id.<br>
<span style="color:green">flutter_slidable:</span>       used to enhance user experience dy slide listview item to perform a particular action.<br>
<span style="color:green">get_storage:</span>            used to cache the api response.<br>
<span style="color:green">connectivity_plus:</span>      used to get device internet connectivity status.<br>
<span style="color:green">flutter_inappwebview:</span>   used to integrate webview.<br>