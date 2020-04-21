import "package:flutter/material.dart";
import "package:graphql_flutter/graphql_flutter.dart";

class GraphQLConfiguration {
  static HttpLink httpLink(String sessionToken) {
    if (sessionToken.isNotEmpty) {
      return HttpLink(
          uri: "https://project-amstel-aqfcp2hu79-api.thebrewery.dev/graphql",
          headers: {
            "X-Parse-Application-Id": "0778713a-e4ca-47ff-a76e-51b4035bf772",
            "X-Parse-Master-Key":
                "b01188ebecf84bbb74d41faae897e32ea4e1c7f0c3c481c6ae464fe342e9a9f3",
            "X-Parse-Session-Token": "$sessionToken"
          });
    } else {
      return HttpLink(
          uri: "https://project-amstel-aqfcp2hu79-api.thebrewery.dev/graphql",
          headers: {
            "X-Parse-Application-Id": "0778713a-e4ca-47ff-a76e-51b4035bf772",
            "X-Parse-Master-Key":
                "b01188ebecf84bbb74d41faae897e32ea4e1c7f0c3c481c6ae464fe342e9a9f3"
          });
    }
  }

  //ValueNotifier this will notify its listener when any kind of value changed
  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      link: httpLink(""),
      cache: OptimisticCache(dataIdFromObject: typenameDataIdFromObject),
    ),
  );

  //this method will let us make queries and mutations in our application
  GraphQLClient clientToQuery() {
    return GraphQLClient(
      cache: OptimisticCache(dataIdFromObject: typenameDataIdFromObject),
      link: httpLink(""),
    );
  }

  GraphQLClient queryViaSession(String sessionToken) {
    return GraphQLClient(
      cache: OptimisticCache(dataIdFromObject: typenameDataIdFromObject),
      link: httpLink(sessionToken),
    );
  }
}
