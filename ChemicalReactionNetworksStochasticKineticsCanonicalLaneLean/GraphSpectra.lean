import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalReactionNetworksStochasticKineticsCanonicalLaneLean

structure GraphSpectraPackage where
  adjacencyMatrix : Type u
  eigenvalues : List ℝ
  algebraicConnectivity : ℝ
  spectralGap : ℝ
  laplacianSpectrum : Type v

structure GraphSpectraEvidence (G : GraphSpectraPackage) where
  algebraicConnectivityPositiveClosed : G.algebraicConnectivity > 0
  spectralGapPositiveClosed : G.spectralGap > 0

def GraphSpectraClosed (G : GraphSpectraPackage) : Prop :=
  G.algebraicConnectivity > 0 ∧ G.spectralGap > 0

theorem graph_spectra_closed_from_evidence (G : GraphSpectraPackage)
    (E : GraphSpectraEvidence G) : GraphSpectraClosed G := by
  exact And.intro E.algebraicConnectivityPositiveClosed
    E.spectralGapPositiveClosed

end ChemicalReactionNetworksStochasticKineticsCanonicalLaneLean
end HautevilleHouse