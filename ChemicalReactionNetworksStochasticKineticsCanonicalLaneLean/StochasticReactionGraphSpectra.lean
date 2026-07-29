import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalReactionNetworksStochasticKineticsCanonicalLaneLean

structure ReactionGraphSpectraPackage where
  adjacencyMatrix : Type u
  laplacianMatrix : Type v
  spectralGap : Prop
  mixingTime : Prop
  graphIsomorphism : Prop
  percolationThreshold : Prop

structure ReactionGraphSpectraEvidence (G : ReactionGraphSpectraPackage) where
  spectralGapClosed : G.spectralGap
  mixingTimeClosed : G.mixingTime
  graphIsomorphismClosed : G.graphIsomorphism
  percolationThresholdClosed : G.percolationThreshold

def ReactionGraphSpectraClosed (G : ReactionGraphSpectraPackage) : Prop :=
  G.spectralGap ∧ G.mixingTime ∧ G.graphIsomorphism ∧ G.percolationThreshold

theorem reaction_graph_spectra_closed_from_evidence
    (G : ReactionGraphSpectraPackage) (E : ReactionGraphSpectraEvidence G) :
    ReactionGraphSpectraClosed G := by
  exact And.intro E.spectralGapClosed
    (And.intro E.mixingTimeClosed
      (And.intro E.graphIsomorphismClosed E.percolationThresholdClosed))

end ChemicalReactionNetworksStochasticKineticsCanonicalLaneLean
end HautevilleHouse