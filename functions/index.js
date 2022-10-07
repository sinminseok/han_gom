const functions = require("firebase-functions");
const admin = require("firebase-admin")
const auth = require('firebase-auth')
// // Create and Deploy Your First Cloud Functions
// // https://firebase.google.com/docs/functions/write-firebase-functions

var serviceAccount = require("./hang-c1561-firebase-adminsdk-npz4k-4a0d7b44fb.json");

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount)
});

 exports.createCustomToken = functions.https.onRequest(async (request, response) => {
  const user = request.body;

  const uid = `kakao:${user.uid}`;
  const updateParams = {
    email: user.email,
    displayName: user.displayName,
  };

  try {
    await admin.auth().updateUser(uid, updateParams);
  } catch (e) {
    updateParams["uid"] = uid;
    await admin.auth().createUser(updateParams);
  }

  const token = await admin.auth().createCustomToken(uid);

  response.send(token);
 });
