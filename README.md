# MetaCrafters ETH+AVAX Proof Error Handling Assessment

This assessment is part of the MetaCrafters ETH+AVAX Proof course

The course provides in-depth knowledge into functions and error handling in Solidity

In this assessment, we had to show the implementation of Error Handling in Solidity

Error handling in programming is a procedure to handle errors that occur during runtime of a program. It helps us handle the interruption and perform some other instructions in response to the error.

In solidity, error handling is implemented using three main functions: require, revert and assert.

## require()
The require function is used to verify conditions before execution. require() takes two arguments, one condition (necessary) and one message (optional).

If the condition becomes false, require() reverts the state of smart contract to its initial state before execution and returns the passed message

Syntax: require(condition, message)

## revert()
revert() does not evaluate any condition and does not depend on any state or statement. 

revert() takes one argument only, i.e. a condition

Whenever the EVM encounters the revert function, it reverts the state of the smart contract back to initial state and returns the passed message

This function must be called within a condition block, filtering the condition for raising the error

Syntax: revert(message)

## assert()
assert() function is used to check for a code that should never be false. 

assert takes one argument,a condition (required)

If the condition resolves to false, assert reverts the state of the smart contract back to initial state and returns the passed message

Syntax: assert(condition)

### Note: require() and revert() return the unused gas back to the caller while assert() uses up all the gas.
