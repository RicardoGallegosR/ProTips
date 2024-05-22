# ProTips
Pro tips de programación mamalones :D

```
import seaborn as sns
import matplotlib.pyplot as plt
import pandas as pd
pd.options.display.max_columns = None


sns.set_theme(style="whitegrid")
sns.set_style("ticks", {"font.family": "Times New Roman"})

colores = plt.cm.tab20.colors
font = {'family': 'Times New Roman', 'size': 14, 'weight': 'normal'}
plt.rcParams['font.family'] = font['family']
plt.rcParams['font.size'] = font['size']
plt.rcParams['font.weight'] = font['weight']
```
