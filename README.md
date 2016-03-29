# Online players' behavior

This repository contains the source code of an in-progress master research project. Despite the importance of competitive games in the world, such as the multiplayer online battle arena (MOBA) genre, there is still a lack of tools and researches based on behavior analysis to help players improve their strategies and skills. Therefore, to reduce this gap the project aims to use machine learning algorithms in the context of the [most popular](https://www.superdataresearch.com/market-data/esports-market-brief/) MOBA, [League of Legends](http://leagueoflegends.com/) (LoL), to analyze and characterize players' behavior in relation to performance.

* Project author: [Fernando Felix do Nascimento Junior](https://linkedin.com/in/fernandofnjr)
* Professor adviser: [Leandro Balby Marinho](https://linkedin.com/in/leandro-balby-marinho-28b696b)
* Master degree Program in Computer Science of the Federal University of Campina Grande

## Data

The project uses a set of historical matches provided by [Riot Games](http://www.riotgames.com/), LoL developer, from its application public interface ([API](https://developer.riotgames.com)). A match history contains data such as game mode, game type and identification number. It also contains basic information statistics of each participant in the match. The documentation of all statistics can be found in the [API Documentation](https://developer.riotgames.com/api/methods#!/1064).

## Source

Two programming languages are used in the project: Python and R. Python to raw and parse the data and R to analyze it.

To raw JSON matches:

1. Configure the Riot API Key in *src/python/config.py*
2. Access *src/python/* through the terminal.
3. Run *pip install -r requeriments.txt*
2. Run *python raw.py*
3. All rawed matches can be found in *src/dump/*

To parse all matches in *src/dump/* to a CSV file:

1. Access *src/python/* through the terminal
2. Run *python parse.py*
3. The created file can be found in *src/data/*

To analyze the parsed data:

1. Open *src/R/analysis.R*
2. Change the line *'../data/data.csv'* to read the CSV file created previously
3. Access *src/R/* through the terminal
4. Run *Rscript analysis.R*
5. The [analysis output](src/output/README.md) can be found in *src/output*

To configure other settings (participant statistics to parse, dump directory, etc.), edit *src/python/config.py*.

## References

C. C. Aggarwal, C. K. Reddy. "Data Clustering - Algorithms and Applications", CRC Press, 2014

A. Drachen, C. Thurau, J. Togelius, G. Yannakakis, C. Bauckage, "Skill-based differences in spatio-temporal team behaviour in Defence of The Ancients 2 (DotA 2)", Games Media Entertainment (GEM), IEEE, pp. 1-8, 2014.

M. S. El-Nasr, A. Drachen, A. Canossa. "Game Analytics - Maximizing the Value of Player Data", Springer-Verlag, 2013.

W. H. Kruskal and W. A. Wallis, "Use of ranks in one-criterion variance analysis", Journal of the American Statistical Association 47. 1952.

R. Lowry, "Concepts & applications of inferential statistics", 2012. [Online]. http://vassarstats.net/textbook/ch11a.html

H. Y. Ong, S. Deolalikar, M. V. Peng, "Player behavior and optimal team composition in online multiplayer games", ArXiv preprint arXiv:1503.02230v1 [cs.SI], 2015. http://arxiv.org/abs/1503.02230

F. Rioult, J. Mtivieita, B. Helleub, N. Scellesc, C. Durandb, "Mining tracks of competitive video games", AASRI Procedia, Vol. 8, pp. 82-87, 2014.

S. Salvador and P. CHAN, "Determining the number of clusters/segments in hierarchical clustering/segmentation algorithms", Proceedings of the 16th IEEE International Conference on Tools with Artificial Intelligence, pp. 576-584, 2004.

Superdata Research. "eSports market brief 2015". http://www.superdataresearch.com

P. Yang, B. Harrison, D. L. Roberts, "Identifying patterns in combat that are predictive of success in MOBA games", Proceedings of Foundations of Digital Games, 2014.

M. J. Zaki and W. Meira Junior, "Data mining and analysis: Fundamental concepts and algorithms", Cambridge University Press, 2014.

## Contributing

See CONTRIBUTING.

## License

[![CC0](https://i.creativecommons.org/l/by-nc-sa/4.0/88x31.png)](https://creativecommons.org/licenses/by-nc-sa/4.0/)

The MIT License.

-

Copyright (c) 2016 [Fernando Felix do Nascimento Junior](https://github.com/fernandojunior/).
