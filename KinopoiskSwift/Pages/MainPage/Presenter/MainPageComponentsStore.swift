//
//  AppDelegate.swift
//  KinopoiskSwift
//
//  Created by Zhalgas on 11/10/20.
//  Copyright © 2020 zhalgas.yegizgarin. All rights reserved.
//

class MainPageComponentsStore {
    var upcomingMovies = [Movie]()
    var nowPlayingMovies = [Movie]()
    var airingTodayTVShows = [TVShow]()
    var popularPersons = [Person]()
    
    private var headerComponents = [MainPageHeaderComponent]()
    
    func convertToHeaderComponents() -> [MainPageHeaderComponent] {
        headerComponents.removeAll()
        headerComponents.append(getMoviesComponent())
        headerComponents.append(getTVShowsComponent())
        headerComponents.append(getPersonsComponent())
        return headerComponents
    }
    
    private func getMoviesComponent() -> MainPageHeaderComponent {
        return MainPageHeaderComponent(
            sectionTitle: TmdbModelType.movie.title,
            components: [
                .showAllItems(listType: TmdbPageableListType.nowPlayingMovies),
                .horizontalListItems(models: nowPlayingMovies),
                .showAllItems(listType: TmdbPageableListType.popularMovies),
                .showAllItems(listType: TmdbPageableListType.topRatedMovies),
                .showAllItems(listType: TmdbPageableListType.upcomingMovies)
            ]
        )
    }
    
    private func getTVShowsComponent() -> MainPageHeaderComponent {
        return MainPageHeaderComponent(
            sectionTitle: TmdbModelType.tvShow.title,
            components: [
                .showAllItems(listType: TmdbPageableListType.airingTodayTVShows),
                .horizontalListItems(models: airingTodayTVShows),
                .showAllItems(listType: TmdbPageableListType.popularTVShows),
                .showAllItems(listType: TmdbPageableListType.topRatedTVShows),
                .showAllItems(listType: TmdbPageableListType.onTheAirTVShows)
            ]
        )
    }
    
    private func getPersonsComponent() -> MainPageHeaderComponent {
        return MainPageHeaderComponent(
            sectionTitle: TmdbModelType.actor.title,
            components: [
                .showAllItems(listType: TmdbPageableListType.popularPersons),
                .horizontalListItems(models: popularPersons)
            ]
        )
    }
    
}
