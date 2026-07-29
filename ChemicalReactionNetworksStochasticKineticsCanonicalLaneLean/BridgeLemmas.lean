import HautevilleHouse.ChemicalReactionNetworksStochasticKineticsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalReactionNetworksStochasticKineticsCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  StochasticKineticsClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  exact A.object.fluctuationDissipationClosed

end ChemicalReactionNetworksStochasticKineticsCanonicalLaneLean
end HautevilleHouse