
declare -a pip_packages=('django' 'numpy' 'nose' 'pip' 'matplotlib' 'pandas' 'nose' 'scipy' 'html5lib' 'statsmodels' 'beautifulsoup' 'virtualenv' 'scipy' 'scikit-learn' 'sympy' 'bokeh' 'plotly' 'Gensim' 'Scrapy' 'Statsmodels' 'testtools' 'sklearn' 'scikit-image' 'statsmodels' 'xlrd' 'geopy' 'shapely' 'pyproj' 'xlsxwriter' 'pyip' 'paramiko' 'flake8' 'mpi4py' 'power' 'pytest' 'html5lib' 'pytc' 'pytz' 'python-dateutil' 'setuptools' 'seaborn' 'scipy' '-U tensorflow' 'keras' 'spark' 'requests[security]' 'cryptography' '--upgrade pip' '--upgrade ndg-httpsclient' 'quandl' 'theano')

function pip_install() {
  # Install numpy
  output=$(sudo -H pip install $i)
  # Check package install
  if [ $? = 0 ]; then
	if [[ $output = *"Collecting $i"*  ]]; then	
	  echo -e "\e[32m $i Installation Successfully.\e[0m"
	elif [[ $output = *"Requirement already"*  ]]; 		then
	  echo -e "\e[33m $i latest vesion already installed in your machine.\e[0m"
	else
		echo -e "$i error:"
	fi

  else
    echo -e "\e[5m \e[31m Problems to install $i check this!\e[0m $output"
  fi
}


case $1 in	
  all)
	echo "Loading"
    for i in "${pip_packages[@]}"
	do	
	   pip_install $i
	done
    ;;

    *)
	sudo apt-get install figlet > /dev/null
	figlet MachineLearning
	echo "(To install all ML packages and libraries)"

    echo -e '''	Usage: sh file_name.sh + Option
        \e[94mInitial_MLsetup.sh all \e[0m -> This will install all packages and libraries in Python for ML.'''

esac

