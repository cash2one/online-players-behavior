import_package('FSelector', attach, attach=TRUE)

#' Compute a feature selection score matrix (cluster_handler) for a given data set for each cluster given a target
#'
#' References:
#' http://ijirts.org/volume2issue2/IJIRTSV2I2034.pdf
#'
#' @seealso information_gain, gini, relieff
cluster_feature_selection = function (data, features, target, cluster, cluster_handler) {
    data = as.data.frame(data)
    features = sort(features)
    clusters = sort(unique(data[, cluster]))

    # matrix to collect the scores (information gain) for each feature x cluster
    score_matrix = matrix(0, nrow=length(clusters), ncol=length(features))
    dimnames(score_matrix) <- list(rownames(score_matrix, do.NULL=FALSE, prefix = cluster), features)

    # compute scores for each cluster given a binary target feature
    for(i in clusters) {
        sample = data[data[, cluster] == i, c(features, target)]
        score = cluster_handler(sample)
        score_matrix[strf('%s%s', cluster, i), ] = round(score[order(rownames(score)), ], digits=3)
    }

    return(score_matrix)
}

#' Compute the information gain for a given data set for each label given a target
#' References:
#' http://stackoverflow.com/questions/33241638/use-of-formula-in-information-gain-in-r
#' http://stackoverflow.com/questions/1859554/what-is-entropy-and-information-gain
information_gain = function (data, features, target, label) {
    return(cluster_feature_selection(data, features, target, label, function (cluster) {
        FSelector::information.gain(as.formula(strf('%s ~ .', target)), cluster)
    }))
}

#' Compute the gini index for a given data set for each label given a binary target
#' References:
#' https://www.r-bloggers.com/calculating-a-gini-coefficients-for-a-number-of-locales-at-once-in-r/
#' http://stats.stackexchange.com/questions/95839/gini-decrease-and-gini-impurity-of-children-nodes
#' https://www.analyticsvidhya.com/blog/2016/04/complete-tutorial-tree-based-modeling-scratch-in-python/
gini = function (data, features, target, label) {
    # calculate a gini index for a data matrix x and multiply by a given proportion p
    gini_ = function (x, p=1) {
        return(as.data.frame(apply(x, 2, ineq::Gini)) * p)
    }

    # compute scores for each cluster given a binary target feature
    return(cluster_feature_selection(data, features, target, label, function (cluster) {
        cluster_target_0 = cluster[cluster[, target] == 0, ]
        cluster_target_1 = cluster[cluster[, target] == 1, ]

        score_target_0 = gini_(cluster_target_0[, features], (nrow(cluster_target_0) / nrow(cluster)))
        score_target_1 = gini_(cluster_target_1[, features], (nrow(cluster_target_1) / nrow(cluster)))
        score = score_target_0 + score_target_1
        return(score)
    }))
}

#' Compute the ReliefF for a given data set for each label given a target. The weights range from -1 to 1 with large
#' positive weights assigned to important features.
#'
#' References:
#' ijirts.org/volume2issue2/IJIRTSV2I2034.pdf
#' https://www.mathworks.com/help/stats/relieff.html?requestedDomain=www.mathworks.com
relieff = function (data, features, target, label) {
    return(cluster_feature_selection(data, features, target, label, function (cluster) {
        FSelector::relief(as.formula(strf('%s ~ .', target)), cluster)
    }))
}

#' Compute the feature relevance using random forest for a given data set for each label given a target
#' References:
#' ijirts.org/volume2issue2/IJIRTSV2I2034.pdf
random.forest.importance = function (data, features, target, label) {
    return(cluster_feature_selection(data, features, target, label, function (cluster) {
        FSelector::random.forest.importance(as.formula(strf('%s ~ .', target)), cluster)
    }))
}