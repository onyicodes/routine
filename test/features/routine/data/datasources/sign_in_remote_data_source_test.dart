// import 'dart:convert';

// import 'package:flutter_test/flutter_test.dart';
// import 'package:http/http.dart' as http;
// import 'package:mockito/mockito.dart';
// import 'package:mockito/annotations.dart';
// import 'package:olevelgurus/api_url.dart';
// import 'package:olevelgurus/core/error/exceptions.dart';
// import 'package:olevelgurus/features/login/data/datasources/sign_in_remote_data_source.dart';
// import 'package:olevelgurus/features/login/data/models/sign_in_model.dart';

// import '../../../../fixture/sign_in_fixture/sign_in_fixture_reader.dart';
// import 'sign_in_remote_data_source_test.mocks.dart';

// @GenerateMocks([http.Client])
// void main() {
//   late SignInRemoteDataSourceImpl remoteDataSource;
//   late MockClient mockHttpClient;
//   setUp(() {
//     mockHttpClient = MockClient();
//     remoteDataSource = SignInRemoteDataSourceImpl(dioClient: mockHttpClient);
//   });

//   void setUpMockHttpClientSuccess200() {
//     when(mockHttpClient.post(any,
//             body: anyNamed('body'), headers: anyNamed('headers')))
//         .thenAnswer((_) async =>
//             http.Response(signInFixture('sign_in_data.json'), 200));
//   }

//   void setUpMockHttpClientFailure404() {
//     when(mockHttpClient.post(any,
//             body: anyNamed('body'), headers: anyNamed('headers')))
//         .thenAnswer(
//       (_) async => http.Response('Something went wrong', 404),
//     );
//   }

//   group('sign in user', () {
//     const user = '07039808388';
//     const password = 'realo';
//     final tSignInEntity =
//         SignInModel.fromJson(json.decode(signInFixture('sign_in_data.json')));

//     test("should perform a get request on a url with application/json header",
//         () {
//       setUpMockHttpClientSuccess200();
//       remoteDataSource.passwordSignIn(phone: user, password: password);
//       Uri signInUri = Uri.parse(baseUrl + signInPath);
//       verify(mockHttpClient.post(signInUri,
//           headers: {'Content-Type': 'application/json'},
//           body: {'phone': user, 'password': password}));
//     });

//     test('should return SignInEntity when the response is code is 200 ',
//         () async {
//       setUpMockHttpClientSuccess200();

//       final result =
//           await remoteDataSource.passwordSignIn(phone: user, password: password);
//       expect(result, equals(tSignInEntity));
//     });

//     test(
//         'should throw a ServerException when the response code is 404 or other',
//         () async {
//       setUpMockHttpClientFailure404();
//       final call = remoteDataSource.passwordSignIn;

//       expect(() => call(phone: user, password: password),
//           throwsA(const TypeMatcher<ServerException>()));
//     });
//   });
// }
