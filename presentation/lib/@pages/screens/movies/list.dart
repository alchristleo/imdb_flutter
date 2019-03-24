import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:imdb_flutter/@redux/index.dart';
import 'package:imdb_flutter/@viewmodels/movie_list_view_model.dart';
import 'package:imdb_flutter/@pages/widgets/loading/loading.dart';
import 'package:imdb_flutter/@pages/widgets/loading/indicator.dart';
import 'package:imdb_flutter/@pages/widgets/loading/error.dart';
import 'package:imdb_flutter/@pages/widgets/movies/movie_list.dart';

class MovieListPage extends StatelessWidget {
    const MovieListPage();

    @override
    Widget build(BuildContext context) {
        return StoreConnector<AppState, MovieListPageViewModel>(
            distinct: true,
            onInit: (store) => store.dispatch(FetchMovieListIfNotLoadedAction()),
            converter: (store) => MovieListPageViewModel.fromStore(store),
            builder: (_, viewModel) => MovieListPageContent(viewModel),
        );
    }
}

class MovieListPageContent extends StatelessWidget {
    MovieListPageContent(this.viewModel);
    final MovieListPageViewModel viewModel;

    @override
    Widget build(BuildContext context) {
        return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
            Expanded(
                child: LoadingView(
                    status: viewModel.status,
                    loadingContent: const Indicator(),
                    errorContent: ErrorView(onRetry: viewModel.refreshMovieList),
                    successContent: MovieListView(viewModel.status, viewModel.movieLists),
                ),
            ),
        ],
        );
    }
}
