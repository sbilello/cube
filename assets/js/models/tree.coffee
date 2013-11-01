#### Tree Model

class @Tree extends Backbone.Model

    initialize: (@col) =>

        @tree = @formTree '0',  @col


    formNode: (node, col) =>
        id = node.get 'id'
        return n =
            id      : id
            cid     : id
            name    : node.get 'name'
            child   : @formTree id, col


    formTree: (parentId, col) =>
        tree = []
        _.each col, (node) =>
            pid = '0'
            pid = node.get 'parentId' if node.get 'parentId'
            tree.push @formNode(node, col) if pid is parentId
        tree
