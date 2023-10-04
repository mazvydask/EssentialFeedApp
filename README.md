# Essential Feed App (cuurently in progress)
A demo project.

![Build Status](https://github.com/mazvydask/EssentialFeed/actions/workflows/CI.yml/badge.svg)


🟢 - Networking Module

🟡 - Persistence Module (in progress)

🔴 - UI + Presentation Module

🔴 - Main Module

 ## BDD Specs

 ### Story: Customer requests to see their image feed

 ### Narrative #1

 > As an online customer
 I want the app to load my latest image feed automatically
 So I can always enjoy the newest images of my friends.

 #### Scenarios (Acceptance criteria)

 ```
 Given the customer has connectivity
 When the customer requests to see their feed
 Then the app should display the latest feed from the remote
   And replace the cache with the new feed
 ```

 ### Narrative #2

 > As an offline customer
 I want the app to show the latest saved version of my image feed
 So I can always enjoy images of my friends

 #### Scenarios (Acceptance criteria)

 ```
 Given the customer doesn't have connectivity
   And there’s a cached version of the feed
   And the cache is less than seven days old
  When the customer requests to see the feed
  Then the app should display the latest feed saved

 Given the customer doesn't have connectivity
   And there’s a cached version of the feed
   And the cache is seven days old or more
  When the customer requests to see the feed
  Then the app should display an error message

 Given the customer doesn't have connectivity
   And the cache is empty
  When the customer requests to see the feed
  Then the app should display an error message
 ```

 ## Use Cases

 ### Load Feed From Remote Use Case

 #### Data:
 - URL

 #### Primary course (happy path):
 1. Execute "Load Image Feed" command with above data.
 2. System downloads data from the URL.
 3. System validates downloaded data.
 4. System creates image feed from valid data.
 5. System delivers image feed.

 #### Invalid data – error course (sad path):
 1. System delivers invalid data error.

 #### No connectivity – error course (sad path):
 1. System delivers connectivity error.

 ### Load Feed Fallback (Cache) Use Case

 #### Data:
 - Max age

 #### Primary course:
 1. Execute the "Load Feed Items" command with the above data.
 2. System retrieves feed data from the cache.
 3. System validates cache is less than seven days old.
 4. System creates feed items from cached data.
 5. System delivers feed items.

#### Retrieval error course (sad path):
 1. System deletes cache.
 2. System delivers error.

 #### Expired cache course (sad path): 
 1. System deletes cache.
 2. System delivers no feed images.

 #### Empty cache course (sad path): 
 1. System delivers no feed images.


 ### Save Feed Items Use Case

 #### Data:
 - Image Feed

 #### Primary course (happy path):
 1. Execute "Save Image Feed" command with above data.
 2. System deletes old cache data.
 3. System encodes image feed.
 4. System timestamps the new cache.
 5. System saves new cache data.
 6. System delivers success message.

 #### Deleting error course (sad path):
 1. System delivers error.

 #### Saving error course (sad path):
 1. System delivers error.

 ## Flowchart

 ![Feed Loading Feature](feed_flowchart.png)

 ## Architecture

 ![Feed Loading Feature](feed_architecture.png)

 ## Model Specs

 ### Feed Image

 | Property      | Type                |
 |---------------|---------------------|
 | `id`          | `UUID`              |
 | `description` | `String` (optional) |
 | `location`    | `String` (optional) |
 | `url`         | `URL`               |

 ### Payload contract

 ```
 GET *url* (TBD)
 200 RESPONSE
 {
     "items": [
         {
             "id": "a UUID",
             "description": "a description",
             "location": "a location",
             "image": "https://a-image.url",
         },
         {
             "id": "another UUID",
             "description": "another description",
             "image": "https://another-image.url"
         },
         {
             "id": "even another UUID",
             "location": "even another location",
             "image": "https://even-another-image.url"
         },
         {
             "id": "yet another UUID",
             "image": "https://yet-another-image.url"
         }
         ...
     ]
 }
 ```
