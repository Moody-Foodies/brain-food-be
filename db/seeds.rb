# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
User.destroy_all
Nutrient.destroy_all

User.create(name: 'John Doe', email: 'john@example.com')
User.create(name: 'Jane Smith', email: 'jane@example.com')
User.create(name: 'Alice Johnson', email: 'alice@example.com')
User.create(name: 'Bob Williams', email: 'bob@example.com')
User.create(name: 'Emily Davis', email: 'emily@example.com')


Nutrient.create(name: 'Folic Acid', health_benefits: 'Info: Folic acid deficiency can lead to things like irritability, anemia, and different behavioral disorders. It is known to help increase the efficacy of antidepressant drugs, effectively helping those who suffer from depression potentially recover, or better manage their symptoms. It is also involved in the synthesis of serotonin, dopamine, epinephrine, and monoamine neurotransmitters, all of which can cause depression and neurochemical deterioration when not produced at the right amount within the brain and body. A study in which mice were placed under chronic unpredictable mild stress and given folic acid, the mice exhibited antidepressant-like effects through various pathways involving monoamine neurotransmitters. Sources: https://www.sciencedirect.com/science/article/pii/S0531556522003813')
Nutrient.create(name: 'Vitamin B12', health_benefits: 'Info: A deficiency in Vitamin B12 may be associated with depression and it has been reported that the incidence of depression is higher in vegetarians due to insufficient intake of vitamin B12. A deficiency plays a role in the formation of depression with its effects on systems within the body including the serotonin and dopamine systems. A lack of B12 can cause depression by producing atrophy, death of neurons, and decreased signaling of neurotransmitters. Sources: https://www.sciencedirect.com/science/article/pii/S0531556522003813')
Nutrient.create(name: 'Vitamin D', health_benefits: 'Info: Vitamin D, while often absorbed through the skin from the sun, is known to have a relationship with the development of depression. Vitamin D plays a role in the production of serotonin in our bodies. It is effective in this production because it not only induces the expression of the gene tryptophan hydroxylase 2, a gene involved in the synthesis of serotonin, it also can help prevent depression development by keeping serotonin at normal levels within the body. The risk of depression increases by 8-14% in those that have a Vitamin D deficiency. It is also moderately effective at helping reduce depression symptoms in individuals with major depression. It can be hard to find foods that naturally contain sources of Vitamin D, however it is present in fatty fish like salmon and tuna, and is often added to milk, other dairy products, and fortified cereals. Sources: https://www.sciencedirect.com/science/article/pii/S0531556522003813')
Nutrient.create(name: 'Fiber', health_benefits: 'Info: Fiber has been shown to lower the risk of anxiety and high psychological distress by 33% and 29% respectively. Studies have also shown that a high level of fiber intake was associated with reduced risk of depression in women and decreased risk of high psychological distress in those that are overweight. A relationship has also been seen between high levels of dietary fiber intake and a lower risk in anxiety. Dietary fiber also assists the body in absorbing glucose/food sugars more slowly, in turn helping avoid sugar rushes and crashes from digesting complex carbohydrates. Some fiber rich foods which are easy to find are things like fruits, vegetables, and some carbohydrates like whole grains and beans. Sources: https://www.ncbi.nlm.nih.gov/pmc/articles/PMC8264187/')
Nutrient.create(name: 'Magnesium', health_benefits: 'Info: Magnesium can provide benefits to the prevention and slowing of progression of things like Alzheimer’s, stroke, diabetes, hypertension, ADHD, and central nervous system functions. It has a protective effect against things like overstimulation that leads to neuronal cell death, and its relationship  with the limbic system is thought to affect the formation and progression of depression. Magnesium intake has proven to be effective at reducing the risk of depression and has been associated with lower levels of anxiety in women. Sources: https://www.sciencedirect.com/science/article/pii/S0531556522003813')
