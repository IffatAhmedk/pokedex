import 'package:graphql/client.dart';

const DefaultAuthToken = "";
const url = "https://graphql-pokeapi.graphcdn.app/";

class GraphqlClient {
  late HttpLink _httpLink;
  late Link _link;
  late GraphQLClient _client;
  late String token;

  getHeaderName({token, otpToken, merchantSlug}) {
    if (token != null) return "Authorization";
    if (otpToken != null) return "x-verification-token";
    if (merchantSlug != null) return "merchant-slug";
  }

  getHeaderValue({token, otpToken, merchantSlug}) {
    if (token != null) return "Bearer $token";
    if (otpToken != null) return otpToken;
    if (merchantSlug != null) return merchantSlug;
  }

  graphQLErrorParser(String error) {
    return error.split(":")[1].trim();
  }

  Future query(
      {required String query, var variables, bool networkOnly = false}) async {
    QueryOptions options =
        QueryOptions(document: gql(query), variables: variables);

    final QueryResult result = await _client.query(options);
    if (result.hasException) {
      return Future.error(graphQLErrorParser(result.exception.toString()));
    }
    return result.data;
  }

  Future mutate({required String query, var variables}) async {
    MutationOptions options =
        MutationOptions(document: gql(query), variables: variables);

    final QueryResult result = await _client.mutate(options);
    if (result.hasException) {
      return Future.error(graphQLErrorParser(result.exception.toString()));
    }
    return result.data;
  }

  GraphqlClient({String? token, String? otpToken, String? merchantSlug}) {
    // String headerKey = this.getHeaderName(
    //     token: token, otpToken: otpToken, merchantSlug: merchantSlug);
    token = this.getHeaderValue(
        token: token, otpToken: otpToken, merchantSlug: merchantSlug);

    final _authLink = AuthLink(
      getToken: () async => '',
    );

    _httpLink = HttpLink(url);
    _link = _authLink.concat(_httpLink);
    _client = GraphQLClient(cache: GraphQLCache(), link: _link);
  }
}
