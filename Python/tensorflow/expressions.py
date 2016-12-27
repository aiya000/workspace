# See https://www.tensorflow.org/api_docs/python/math_ops/
import tensorflow as tf

# N-ary trees
#    add -- reference of `counter`
#        \_ 1
print("- first -")

# Define the variable of `counter`
var     = tf.Variable(0, name="counter")
# Define the expression of `(add (counter 1))`
new_val = tf.add(var, tf.constant(1))
# Define the substitution of `let count = (add (counter 1))`
update  = tf.assign(var, new_val)

# Execute created expression
with tf.Session() as sess:
    sess.run(tf.global_variables_initializer())
    for _ in range(5):
        sess.run(update)
        print(sess.run(var))


# The expression of `(add (1 (sub (3 2))))`
print("- second -")

var     = tf.Variable(0, name="bar")
new_val = tf.add(tf.constant(1), tf.subtract(tf.constant(3), tf.constant(2)))
update  = tf.assign(var, new_val)
with tf.Session() as sess:
    sess.run(tf.global_variables_initializer())
    sess.run(update)
    print(sess.run(var))
