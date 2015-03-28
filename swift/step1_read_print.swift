//******************************************************************************
// MAL - step 1 - read/print
//******************************************************************************
// This file is automatically generated from templates/step.swift. Rather than
// editing it directly, it's probably better to edit templates/step.swift and
// regenerate this file. Otherwise, your change might be lost if/when someone
// else performs that process.
//******************************************************************************

import Foundation

// Parse the string into an AST.
//
func READ(str: String) -> MalVal {
    return read_str(str)
}

// Walk the AST and completely evaluate it, handling macro expansions, special
// forms and function calls.
//
func EVAL(ast: MalVal) -> MalVal {
    if is_error(ast) { return ast }
    return ast
}

// Convert the value into a human-readable string for printing.
//
func PRINT(exp: MalVal) -> String? {
    if is_error(exp) { return nil }
    return pr_str(exp, true)
}

// Perform the READ and EVAL steps. Useful for when you don't care about the
// printable result.
//
func RE(text: String) -> MalVal? {
    if text.isEmpty { return nil }
    let ast = READ(text)
    if is_error(ast) {
        println("Error parsing input: \(ast)")
        return nil
    }
    let exp = EVAL(ast)
    if is_error(exp) {
        println("Error evaluating input: \(exp)")
        return nil
    }
    return exp
}

// Perform the full READ/EVAL/PRINT, returning a printable string.
//
func REP(text: String) -> String? {
    let exp = RE(text)
    if exp == nil { return nil }
    return PRINT(exp!)
}

// Perform the full REPL.
//
func REPL() {
    while true {
        if let text = _readline("user> ") {
            if let output = REP(text) {
                println("\(output)")
            }
        } else {
            println()
            break
        }
    }
}

func main() {
    load_history_file()
    REPL()
    save_history_file()
}