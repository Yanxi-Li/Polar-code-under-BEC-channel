# Polar-code-under-BEC-channel
MATLAB simulation for Polar code under BEC
参数设置：
	N：码长
	K：信息码码长
	Rate：码率
	A：信息码位置集合
	Ac：冻结比特位置集合
	u_a：冻结比特
	u：信源码
	G：生成矩阵
	x：编码码元
	y：接收码元
	decoded_output：接收码元译码结果
	decoded_output_message：信息码译码结果
MATLAB文件说明：
	polar_simulation.m:将polar码系统仿真封装成函数，包括Polar码构造-编码-BEC信道-译码
	polar_codeconstruction.m:用于polar码构造
	Z_Bhattacharyya.m:计算巴氏参数
	polar_encode.m:polar码编码
	BEC.m:BEC信道
	init_LR.m:似然值初始化
	compute_lr.m:计算似然值
	decide.m:根据似然值做判决
	SC_decode.m:SC译码器
	polarization_example.m:该文件用于仿真信道极化现象，画出极化图
	Polar_example.m:该文件为一次polar码系统仿真举例
	main_polar.m:该文件用于仿真BER与擦除概率以及码率的关系
	N_BER.m：该文件用于仿真BER与码长N之间的关系
