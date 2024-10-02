# imapfilter-yaml

imapfilter templates to produce lua configuration from yaml files

## prerequisites
* jinja2 cli
* sh

## adding this repo as submodule
You can add this repository as submodule of youre rules repository to generate lua files.
This can be achieved this way:

~~~
git submodule add https://github.com/simbelmas/imapfilter-kube.git imapfilter-kube
git submodule init imapfilter-kube
~~~

To update at a further date:

~~~
git submodule update --remote
~~~

To use development version:

~~~
git submodule set-branch --branch dev imapfilter-kube
git submodule update --remote
~~~

To come back to main version:

~~~
git submodule set-branch --default imapfilter-kube
git submodule update --remote
~~~

## Calling generator
generate_imapfilter_config.sh {IMAFILTER_CONFIG_DIR} {JINJA_VAR_FILES}

if jinja2 variable 'imapfilter_sleep_duration' is set, the configuration does not use *enter_idle()* function but runs in a loop with a correspondinng sleep time.

The script uses templates in templates dir to generate 2 lua files used by imapfilter.
imapIdleDaemon.lua is the config file to point from imapfilter cmdline
