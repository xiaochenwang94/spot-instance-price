from __future__ import print_function

import numpy as np
import hmmlearn.hmm as hmm
import pandas as pd

data = pd.read_table('./data/m4.xlarge.linux')
price = data['Price']
index = np.arange(0,price.size)
price2 =
print (price2)
print("fitting to HMM and decoding ...", end="")

model = hmm.GaussianHMM(n_components=4, covariance_type="diag", n_iter=1000).fit(price2)
hidden_state = model.predict(price)
print("done")

###############################################################################
# Print trained parameters and plot
print("Transition matrix")
print(model.transmat_)
print()


