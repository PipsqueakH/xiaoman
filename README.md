# xiaoman
在一个密室中发现了一个古老的密码，由两行字母组成

gfekjmlinhpoqdutsrvcbxwyaBAzEDGFC
gfkmljnipqoheutsvrdcxywbBAEGFDCza

通过ApsaraDB团队成员合作破译，终于破解了这个密码。

这个加密方式采用了两种变换，

1

首先利用了二叉树结构。

这两组字母表示了一棵二叉树。

第一组是中序遍历的结果。
第二组是后序遍历的结果。

首先要获取这颗二叉树层次遍历（从上到下，从左到右）的结果。

2

通过一个密码本来变换层次遍历得到的结果拿到最终的明文，幸运的是在密室的角落里。

这个密码本也被发现了：

{"abcdefghijklmnopqrstuvwxyzABCDEFG", "Wec_otphsaeamDaB_iert_otolm_ejn_A"}

注意：第一个字符串中的字母对应相应位置的第二个字符串中的字母。

现在，请使用Erlang编写一个函数：

apsaradb(InOrder, PostOrder, TransformTable)

拿到明文结果

apsaradb("gfekjmlinhpoqdutsrvcbxwyaBAzEDGFC", "gfkmljnipqoheutsvrdcxywbBAEGFDCza", {"abcdefghijklmnopqrstuvwxyzABCDEFG", "Wec_otphsaeamDaB_iert_otolm_ejn_A"})

小满+Erlang
