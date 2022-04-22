package ex.pkg1;

import java.util.Random;

/**
 *
 * @author joaoc
 */
public class AlgGenetico {
    private final int populationSize;
    private final double mutationRate;
    private final double crossOverRate;
    private final int elitismCount;
    private Individual individuo;

    public AlgGenetico(int populationSize, double mutationRate, double crossOverRate, int elitismCount) {
        this.populationSize = populationSize;
        this.mutationRate = mutationRate;
        this.crossOverRate = crossOverRate;
        this.elitismCount = elitismCount;
    }

    public Population initPopulation(int chromossomeLength){
        return new Population(this.populationSize, chromossomeLength);
    }

    public double calculateFitness(Individual individual, String target){
        int correctGenes = 0;
        double fitness;
        for (int i = 0; i < individual.getGenes().length; i++){
            if (individual.getGene(i) == target.charAt(i)){
                correctGenes++;
            }
        }

        fitness = (double) correctGenes / individual.getGenes().length;
        individual.setFitness(fitness);
        return fitness;
    }
    
    public void evalPopulation(Population population, String target){
        double populationFitness = 0;
        for (Individual individual : population.getIndividuals()){
            populationFitness += calculateFitness(individual, target);
        }
        population.setPopulationFitness(populationFitness);
    }
    
    public Individual selectParent(Population population){
        Individual[] individuals = population.getIndividuals();
        double populationFitness = population.getPopulationFitness();
        double rouletteWheelPosition = Math.random() * populationFitness;
        double spinWheel = 0;

        for (Individual individual : individuals){
            spinWheel += individual.getFitness();
            if (spinWheel >= rouletteWheelPosition) {
                return individual;
            }
        }
        return individuals[population.getIndividuals().length-1];
    }
    
    public Population crossoverPopulation( Population population){
        Population newPopulation = new Population(population.getIndividuals().length);

        for (int i = 0; i < population.getIndividuals().length; i++){
            Individual parentA = population.getFittest(i);

            if (this.crossOverRate > Math.random()  && i > this.elitismCount){
                Individual offspring = new Individual(parentA.getGenes().length);
                Individual parentB = selectParent(population);

                for (int geneIndex = 0; geneIndex < parentA.getGenes().length; geneIndex++){
                    if (0.5> Math.random()){
                        offspring.setGene(geneIndex, parentA.getGene(geneIndex));
                    }else {
                        offspring.setGene(geneIndex, parentB.getGene(geneIndex));
                    }
                }
                newPopulation.setIndividual(i, offspring);
            }else {
                newPopulation.setIndividual(i, parentA);
            }
        }
        return newPopulation;
    }
    
    public Population mutatePopulation(Population population){
        Population newPopulation = new Population(this.populationSize);

        for (int i = 0; i < population.getIndividuals().length; i++){
            Individual individual = population.getFittest(i);

            for (int geneIndex = 0; geneIndex < individual.getGenes().length; geneIndex++){
                if (i >= this.elitismCount){
                    if (this.mutationRate > Math.random()){
                        individual.setGene(geneIndex, individual.randomChar());
                    }
                }
                newPopulation.setIndividual(i, individual);
            }
        }
        return newPopulation;
    }

    public boolean isTerminationConditionMet(Population population){
        for (Individual individual : population.getIndividuals()){
            if (individual.getFitness() == 1){
                return true;
            }
        }
        return false;
    }
}
