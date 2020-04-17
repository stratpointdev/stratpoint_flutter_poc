

class QueryStrings{


  static String loginQueryString(String username, String password){
    return """
    mutation{
      users{
        logIn(username: "$username", password: "$password"){
          sessionToken
        }
      }
    }
    """;
  }

  static String userQueryString() {
    print("""
      query{
         users{
            me{
              user
            }
           }
        }
    """);
    return """
      query{
         users{
            me{
                objectId
                firstname
                middlename
                lastname
                company
                mobileNumber
                email
                securityQuestion
                securityAnswer
            }
           }
        }
    """;
  }

}