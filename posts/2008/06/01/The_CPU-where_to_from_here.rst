.. title: The CPU - where to from here?
.. slug: The_CPU-where_to_from_here
.. date: 2008-06-01 10:26:00 UTC+10:00
.. tags: tech,blog,James
.. category: 
.. link: 

Modern computers have at their heart a piece of equipment commonly
referred to as the "Central Processing Unit" (CPU). This is common
knowledge and regularly used as the final determinant factor in a
computer's performance. The reality of a machine's performance,
however, is a much more complicated equation. Like many devices, the
overall performance is a measure of the sum of parts that compose the
system. Similarly, a single poorly performing component can undermine,
or even negate, the performance of the other components. Using
blindingly fast CPU's in a system with very slow memory will result in
a computer that is well below accepted standards. However, fast
components are becoming very cheap and offer other advantages beyond
the initial design goals of the component in question.

.. TEASER_END

.. image:: http://fastra.ua.ac.be/images/pic_internal.jpg: http://fastra.ua.ac.be/images/pic_internal.jpg

For instance, most people are unaware that their video card has a
highly specialised processor call a "Graphics Processing Unit" (GPU).
The GPU, unlike the CPU is designed for a set of very specific
calculations; usually matrix transformations using arbitrarily precise
floating point numbers - usually double precision floating points, but
not always. The GPU typically runs at a slower clock speed than the
CPU and uses a very fast, purpose-built memory subsystem of its own
too. Combined, the video card's GPU and memory are capable of some
truly mind-boggling calculations. Here's where things get interesting;
many facets of science and "non-graphic" mathematics use exactly the
same type of calculations the GPU was designed for. In fact nVidia has
even released a programming framework (called `CUDA`_) to leverage
their GPU's for doing things other than playing games. Researchers in
`Belgium at the University of Antwerp`_, have now been able to build a
system, `capable of super-computer speeds, using commodity graphics
cards totalling eight GPU's`_!

For quite some time now, I've considered the role of the general
purpose microprocessor, aka CPU, rather limiting. As stated before, a
single component doesn't in itself determine how fast a machine will
be, but a single component can certainly determine how *slow* a
machine will be. I believe the time is coming when to move beyond
current performance limitations, the computer industry will need to
utilise specialised processors for specialised tasks. Given the
generalist role a CPU must undertake, by design it is a compromise to
balance performance across a broad set of tasks, consequently it will
never excel at any specific task. However, if the CPU could offload
particular tasks to other, external, processing units specialised for
that particular task the overall performance of the system would
increase significantly. We have already seen this in limited ways with
the advent of hardware-based storage controllers, dedicated graphics
processors and I would argue the advent of the northbridge for direct
access to various busses that link the core of the system together.
Prior to the separation of the CPU and northbridge, all input and
output (I/O) to any device was forced to go through the CPU. With
northbridge controller the CPU could be freed up and many devices are
capable of direct communication and data transfer.

In conclusion, I look forward to future of the CPU; whether it's a
Intel "Core", IBM "Cell" or any other processor. However, what really
interests me, is the rise of the specialist processor and how we as
programmers and system engineers can find new and innovative ways to
implement them to augment and enhance overall system performance in
specialised ways.

* Credits: *


+ Image of computer system above:
  `http://fastra.ua.ac.be/images/pic_internal.jpg`_ While you're there,
  check out all the images and screen shots etc. of this `tiny super
  computer`_


.. _capable of super-computer speeds, using commodity graphics cards totalling eight GPU's: http://www.dvhardware.net/article27538.html
.. _CUDA: http://www.nvidia.com/object/cuda_home.html
.. _Belgium at the University of Antwerp: http://visielab.ua.ac.be/
.. _tiny super computer: http://fastra.ua.ac.be/en/images.html
.. _image: http://fastra.ua.ac.be/images/pic_internal.jpg: http://fastra.ua.ac.be/images/pic_internal.jpg
