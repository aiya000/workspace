import tensorflow as tf

hello = tf.constant("Hello, world !!!")
sess  = tf.Session()
print(sess.run(hello))

x = tf.constant(10)
y = tf.constant(20)
print(sess.run(x + y))
