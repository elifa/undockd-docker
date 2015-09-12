#!flask/bin/python
from undockd import undockd

if __name__ == '__main__':
	undockd.run(host='0.0.0.0', port=int(os.environ.get('PORT', 5000), debug=True)
