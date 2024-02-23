<!--
This is the abstract submission template for the 
2024 Insurance Data Science Conference.

Please edit this Markdown file and send it to
abstract@insurancedatascience.org by close of play
6 March 2024. 

We will send you a confirmation email that we received 
your submission.

You can edit this file with any text editor, including RStudio, or use one  of the online editors, such as:

 - https://markdownlivepreview.com
 - https://jbt.github.io/markdown-editor/
 - https://pandao.github.io/editor.md/en.html

Please send us the file as an attachment with md file extension.
-->
 ## Obtaining Fair Insurance Premiums with Multiple Sensitive Attributes
<!-- replace above with your abstract title -->

### Arthur Charpentier, UQAM, Montréal, Canada (presenter)
### Agathe Fernandes Machadoa, UQAM, Montréal, Canada
### Suzie Grondin, ENSAE, Paris, France & UQAM, Montréal, Canada
### François Hu, Université de Montréal, Montréal, Canada & Milliman Paris, France
### Philipp Ratz, UQAM, Montréal, Canada

**Abstract**: According to Kranzberg’s law, “*technology is neither good nor bad, nor is it neutral*”. In the case of discrimination, this is all the more true as the notion of intent no longer exists in law (indirect discrimination). Without bad intent, a predictive algorithm used in fraud analysis, to estimate compensation for bodily injury, or to set a rate, can perfectly well be racist, ageist, sexist, or all three at once. As claimed by Kearns et al. (2019), “*machine learning won’t give you anything like gender neutrality `for free’ that you didn’t explicitly ask for*”. Here, we'll look at how to achieve (strict) neutrality in pricing algorithms, using post-processing approaches.
In Charpentier et al. (2023), we discussed the use of Wasserstein barycenter to obtain fair price, well-balanced, and also that also satisfy statistical guarantees (smallest loss within the class of fair models). Unfortunately, they might struggle to provide a transparent and accurate path to achieve fairness when more than one sensitive variable, such as a combination of gender and race, is involved, for example. Here, we propose an interpretable approach, using some sequential mechanism.

**Keywords**: Discrimination, Fairness, Interpretable, Optimal Transport, Wassertein
<!-- replace above with your keywords -->

### References
<!-- Provide your reference below. No more than 5 references -->

1. Charpentier, A., Hu, F., & Ratz, P. (2023). Mitigating Discrimination in Insurance with Wasserstein Barycenters. [arXiv:2306.12912](https://arxiv.org/abs/2306.12912), *BIAS 2023*.
2. Charpentier, A. (2024). Insurance, biases, discrimination and fairness. Springer.
3. Roth, A., & Kearns, M. (2019). The Ethical Algorithm. Oxford University Press.
4. Hu, F., Ratz, P., & Charpentier, A. (2023). A sequentially fair mechanism for multiple sensitive attributes. [arXiv:2309.06627](https://arxiv.org/abs/2309.06627), *AAAI 2024*.
5. Machado, A., Grondin, S., Hu, F., Ratz, P. & Charpentier, A. (2024). Sequential fairness using optimal transport. *In progress* [equipy](https://equilibration.github.io/equipy/)

### Contact details
 
 - Email: charpentier.arthur@uqam.ca 
 - Homepage: https://freakonometrics.github.io/ 
 - Repository: https://equilibration.github.io/equipy/ 
 - Social media: [Linkedin](https://www.linkedin.com/in/arthurcharpentier/)
