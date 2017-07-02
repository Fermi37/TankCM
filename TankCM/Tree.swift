//
//  Tree.swift
//  CenterOfMass
//
//  Created by Yuri Bulavin on 15.03.17.
//  Copyright © 2017 SciSolution. All rights reserved.
//

import Foundation

//
//  Tree.swift
//  BeamsCalculator
//
//  Created by Yuri Bulavin on 15.07.16.
//  Copyright © 2016 Yuri Bulavin. All rights reserved.
//

import Foundation



enum Tree<T>
{
    case end
    indirect  case node(Tree<T>, T, Tree<T>)
    
    init()
    {
        self = Tree<T>.end
    }
    
    init(data: T)
    {
        self = .node(.end, data, .end)
    }
    
}


extension Tree
{
    
    func all() -> [T] {
        var result = [T]()
        switch self {
        case let .node(left, e, right):
            result += [e] + left.all() + right.all()
        default:
            break
        }
        return result
    }
    
    
}

extension Tree
{
    func map<V>(_ tranform: (T) -> V) -> Tree<V>
    {
        var result: Tree<V>
        switch self {
        case let .node(left, node, right):
            let newLeft = left.map(tranform)
            let newRight = right.map(tranform)
            result = Tree<V>.node(newLeft, tranform(node), newRight)
        default:
            result = Tree<V>()
        }
        return result
    }
}


extension Tree {
    
    func addLeftLeaf(_ object: T) -> Tree<T> {
        var result: Tree<T>
        switch self {
        case let .node(left, node, right):
            result = Tree<T>.node(left.addLeftLeaf(object), node, right)
        default:
            let newTree = Tree<T>.node(.end, object, .end)
            result = newTree
        }
        return result
    }
    
    func addRightLeaf(_ object: T) -> Tree<T> {
        var result: Tree<T>
        switch self {
        case let .node(left, node, right):
            result = Tree<T>.node(left, node, right.addRightLeaf(object))
        default:
            let newTree = Tree<T>.node(.end, object, .end)
            result = newTree
        }
        return result
    }
    
    func replaceLeftLeaf(with tree: Tree<T>) -> Tree<T> {
        var result: Tree<T>
        switch self {
        case let .node(left, node, right):
            result = Tree<T>.node(left.replaceLeftLeaf(with: tree), node, right)
        default:
            let newTree = tree
            result = newTree
        }
        return result
    }
    
    
    func replaceRightSubtree(with tree: Tree<T>) -> Tree<T>
    {
        var result = Tree<T>()
        switch self {
        case let .node(left, node, _):
            result = .node(left, node, tree)
        default:
            break
        }
        return result
    }
    
}







