import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';

class AuthRepository{
  //sign in
Future<String> fetchUserIdFromAttributes()async{
  final attributes = await Amplify.Auth.fetchUserAttributes();

  final subAttributes = attributes.firstWhere((element) => element.userAttributeKey=='sub');

  final userId = subAttributes.value;

  return userId;
}

 Future<String> webSignIn()async{
    try{
      SignInResult result = await Amplify.Auth.signInWithWebUI();

      if(result.isSignedIn){
          //get userId
        return await fetchUserIdFromAttributes();
      }
      else{
        throw Exception("Could Not Sign In");
      }
    }catch(e){
        throw e;
    }
  }

  //sign out
 Future<void> signOut() async{
  try{
    await Amplify.Auth.signOut();
  }catch(e)
   {
     throw e;
   }
 }
  //auto sign in

  Future<String> autoSingIn() async{
    try{
      return await fetchUserIdFromAttributes();
    }catch(e)
    {
      throw e;
    }
  }
}