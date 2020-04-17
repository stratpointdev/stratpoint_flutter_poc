





import 'package:finished_notes_firebase_ddd_course/infrastructure/login/query_strings.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../main.dart';
import 'models/profile.dart';

class UserService{

  GraphQLClient _client = graphQLConfiguration.clientToQuery();

   Future<String> logInUser(String username, String password) async {
     print("logInUser "+username+"--"+password);
    QueryResult queryResult = await _client.mutate(
      MutationOptions(
        documentNode: gql(QueryStrings.loginQueryString(
          username,
          password,
        )),

        // you can update the cache based on results
        update: (Cache cache, QueryResult result) {
          print("update"+cache.toString());
          return cache;
        },
        // or do something with the result.data on completion
        onCompleted: (resultData) {
          print("onCompleted"+resultData.toString());
        },
        onError: (error){
          print("onError"+error.toString());
          return error;
        }
      ),
    );
    if(!queryResult.hasException){
      print("session");
      return queryResult.data['users']["logIn"]["sessionToken"];
    }else{
      print("error");
      return "error";
    }
  }

  Future<String> logInViaSession( String sessionToken) async {
    print("sessionToken "+sessionToken);
    QueryResult queryResult = await  graphQLConfiguration.queryViaSession(sessionToken).mutate(
      MutationOptions(
          documentNode: gql(QueryStrings.userQueryString()),

          // you can update the cache based on results
          update: (Cache cache, QueryResult result) {
            return cache;
          },
          // or do something with the result.data on completion
          onCompleted: (dynamic resultData) {

          },
          onError: (error){
            return error;
          }
      ),
    );
    if(!queryResult.hasException){

      return "success";

    }else{
      print(queryResult.exception);
      return "error";
    }
  }

  Future<Profile> getUserViaSession( String sessionToken) async {

    QueryResult queryResult = await  graphQLConfiguration.queryViaSession(sessionToken).mutate(
      MutationOptions(
          documentNode: gql(QueryStrings.userQueryString()),

          // you can update the cache based on results
          update: (Cache cache, QueryResult result) {
            return cache;
          },
          // or do something with the result.data on completion
          onCompleted: (dynamic resultData) {

          },
          onError: (error){
            return error;
          }
      ),
    );
    if(!queryResult.hasException){
      print(queryResult.data['users']["me"]["securityQuestion"]);
      print(queryResult.data['users']["me"]["securityAnswer"]);
      return new Profile(
        objectId:queryResult.data['users']["me"]["objectId"],
        firstname:queryResult.data['users']["me"]["firstname"],
        middlename:queryResult.data['users']["me"]["middlename"],
        lastname:queryResult.data['users']["me"]["lastname"],
        company: queryResult.data['users']["me"]["company"],
        mobileNumber:queryResult.data['users']["me"]["mobileNumber"],
        emailAddress: queryResult.data['users']["me"]["email"],
        securityQuestion:  queryResult.data['users']["me"]["securityQuestion"],
        securityAnswer: queryResult.data['users']["me"]["securityAnswer"],
      );


    }else{
      return null;
    }
  }

}