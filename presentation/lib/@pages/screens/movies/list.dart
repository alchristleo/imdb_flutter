import 'package:flutter/cupertino.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:imdb_flutter/@redux/index.dart';
import 'package:imdb_flutter/@viewmodels/movie_list_view_model.dart';
import 'package:imdb_flutter/@pages/widgets/loading/loading.dart';
import 'package:imdb_flutter/@pages/widgets/movies/movie_list.dart';
import 'package:imdb_flutter/@pages/widgets/placeholder/placeholder.dart';

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
        return Container(
            margin: const EdgeInsets.only(bottom: 80.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                    Expanded(
                        child: LoadingView(
                            status: viewModel.status,
                            loadingContent: const MoviePlaceholder(),
                            errorContent: const MoviePlaceholder(),
                            successContent: MovieListView(viewModel.status, viewModel.movieLists),
                        ),
                    ),
                ],
            ),
        );
    }
}
