# Global Galois duality and compact coefficients — blueprint

This blueprint covers stages R02.1–R02.6, D7 and D8, within the boundaries RS-08 accepted. This
first checkpoint plans **R02.1**, the passage from finite discrete coefficients to compact p-adic
ones. It follows:
- Rubin, *Euler systems*, Appendix B §2 and Chapter I §2;
- the Stacks Project (derived limits);
- Harpaz–Wittenberg, *The Massey vanishing conjecture for number fields*, Lemma 5.5, which the
  maintainer added to this layer.

The other stages are not yet read.

## Purpose

Arithmetic applications use Galois cohomology with coefficients in a lattice T, its rationalisation
V = T[1/p], and the discrete quotient W = V/T. Tau Ceti's ProfiniteCohomology treats discrete
coefficients. This layer makes the compact and rational cases rigorous:
- inverse limits and their lim¹ terms;
- Tate's comparison with finite levels;
- continuous sections;
- rationalisation.

These are exactly the inputs that SelmerIwasawaCohomology:L0 (the p-adic Kummer identification) and
EulerSystemsCyclotomicMainConjecture:L0 (Kummer classes) request.

## Ownership (RS-08)

R02.1 keeps:
- the compact-lattice, rational and discrete-quotient comparisons;
- the Mittag-Leffler and Milnor lemmas, with lim¹ retained;
- the cochain and topology comparisons, rationalisation, and completed-tensor hypotheses.

It reuses Mathlib's `continuousCohomology` carrier and Tau Ceti's discrete theory (ProfiniteCohomology
Layers 3–5 and 8).

## What the libraries supply

**Mathlib supplies:**
- `continuousCohomology` of a topological representation, through homogeneous cochains;
- `CategoryTheory.Functor.IsMittagLeffler` for functors to types;
- `continuous_pi_iff`.

**Tau Ceti supplies** `TauCeti.homAction`: the conjugation action on `M →+ N`, which is continuous
for finite discrete M.

**Missing:** everything below.

## Conventions

- Towers are ℕ-indexed inverse systems (A_n, φ_n : A_{n+1} → A_n).
- lim and lim¹ are the kernel and cokernel of the shift ∏A_n → ∏A_n, and they compute R⁰lim and
  R¹lim.
- Continuous cochains are inhomogeneous: Maps(Gⁱ, T), continuous for the coefficient topology.
- Hom_pt(C, A) carries the pointwise topology.

## R02.1. Topological coefficients and inverse limits

Module `TauCeti/RepresentationTheory/Homological/ContCohomology/Compact`, namespace
`TauCeti.CompactCoefficients`.

### Derived limits

**Construction: lim and lim¹** (`Tower.lim`, `Tower.limOne`; node `lim-one`; planet "Derived
limits").

*API.*
- `mem_lim`.
- `limOne_subsingleton_of_surjective`.

*Unit tests.*
- The tower ℤ/p^{n+1} ↠ ℤ/p^n has lim¹ = 0.
- Non-example: ℤ ←(·p) ℤ has lim = 0 and lim¹ ≅ ℤ_p/ℤ.
- The constant tower has lim equal to the diagonal.

**Construction: Mittag-Leffler towers** (`Tower.IsMittagLeffler`; node `mittag-leffler`).

*API.*
- `isMittagLeffler_of_surjective`.
- `isMittagLeffler_of_finite`.
- `isMittagLeffler_iff_functor`: agreement with Mathlib's notion.

*Unit tests.*
- Finite towers are Mittag-Leffler.
- Towers with surjective transitions are Mittag-Leffler.
- Non-example: multiplication by p is not Mittag-Leffler.

**Lemma: Mittag-Leffler kills lim¹** (`limOne_subsingleton_of_isMittagLeffler`; node
`mittag-leffler-lim-one`); Stacks Lemma 15.88.1.

**Theorem: the six-term sequence** (node `lim-one-six-term`). 0 → lim A → lim B → lim C → lim¹A →
lim¹B → lim¹C → 0.

**Theorem: the Milnor sequence** (node `milnor-sequence`; planet). For towers of complexes with
surjective transitions: 0 → lim¹ H^{p−1} → H^p(lim) → lim H^p → 0 (Stacks Lemma 15.88.10).

### Continuous cochains and the canonical carrier

**Lemma: lifting cochains** (`exists_lift_continuous`; node `cochain-lifting`). Continuous maps from
a compact totally disconnected space lift along finite surjections. So cochain towers have
surjective transitions.

**Lemma: cochains into limits** (node `cochains-inverse-limit`). C^•(G, lim T_n) = lim C^•(G, T_n).

**Theorem: carrier comparison** (node `carrier-comparison`). Mathlib's `continuousCohomology`
agrees with inhomogeneous continuous cochains for compact and rational coefficients. This extends
ProfiniteCohomology Layer 3.

**Theorem: Tate's inverse-limit theorem** (node `tate-inverse-limit`; planet). Its content:
- the sequence 0 → lim¹ H^{i−1}(G, T_n) → H^i(G, T) → lim H^i(G, T_n) → 0;
- H^i(G, T) = lim H^i(G, T_n) when every H^{i−1}(G, T_n) is finite (Rubin Proposition B.2.3).

**Lemma: continuous sections** (node `continuous-section-exists`). A continuous section exists in
each of these cases (Rubin Remark B.2.2):
- the quotient is discrete;
- the kernel is open;
- the module is a finitely generated ℤ_p-module;
- the module is a finite-dimensional ℚ_p-space.

**Theorem: long exact sequences** (node `continuous-section-long-exact`). With a continuous section,
continuous cochains form a short exact sequence, and there is a long exact sequence (Rubin Definition
B.2.1).

### Rationalisation and the discrete quotient

**Lemma: cochains into V land in a lattice** (`exists_pow_smul_mem_lattice`; node
`compact-cochain-bounded`).

**Theorem: rationalisation** (node `rationalization`; planet). H^i(G, T) ⊗ ℚ_p ≅ H^i(G, V), and
H^i(G, T) has no divisible elements (Rubin Proposition B.2.4).

**Lemma: the discrete quotient** (node `discrete-quotient-colimit`). H^i(G, W) = colim_n
H^i(G, W[p^n]).

**Lemma: torsion of H¹(T)** (node `lattice-torsion-sequence`). V^G → W^G → H¹(G, T)_tors → 0, and
ker(H¹(T) → H¹(V)) = H¹(T)_tors (Rubin Lemma I.2.2).

### Pointwise Hom and the splitting torsor

This is Harpaz–Wittenberg's Lemma 5.5, corrected.

**Construction: Hom_pt** (`HomPt`; node `pointwise-hom`). The pointwise topology and the
conjugation action.
- `continuous_eval`: evaluation is jointly continuous.
- `discreteTopology_of_fg`: finitely generated C gives the discrete topology.
- `homPt_equiv_internalHom`: for finite C this is Tau Ceti's InternalHom.

*Unit tests.*
- Hom_pt(ℤ, A) ≅ A.
- Finitely generated C gives the discrete topology.
- Non-example: Hom_pt(⊕_ℕ 𝔽₂, 𝔽₂) = 𝔽₂^ℕ is not discrete.

**Construction: the splitting torsor** (`Sections`, `splittingClass`; node `splitting-torsor`).
The sections form a continuous Hom_pt(C, A)-torsor. The cocycle is γ(g) = g s g⁻¹ − s, and its class
vanishes iff there is an equivariant section.

*Unit tests.*
- An equivariantly split sequence has class 0.
- A = 0 gives class 0.
- Harpaz–Wittenberg's counterexample for discrete Hom.

**Theorem: ∂ = cup with the torsor class** (node `connecting-cup-formula`). ∂[c] = [γ ∪ c], by a
cochain computation; no Ext interpretation is claimed.

**Lemma: the finitely generated case** (node `discrete-hom-finitely-generated`). For finitely
generated C, the printed Lemma 5.5 holds with discrete Hom.

## Source finding

Harpaz–Wittenberg, Lemma 5.5, is false for C that is not finitely generated. This is already
recorded as PAPER-HARPAZ-WITTENBERG-23/E10; here it is `known` and the nodes use the corrected
form.

## Requests

Tau Ceti ProfiniteCohomology:
- Layer 3: the discrete carrier comparison;
- Layer 4: colimits in the coefficients;
- Layer 5: the discrete long exact sequences;
- Layer 8: low-degree cup products.

## Acceptance

- Tate's theorem with the lim¹ term explicit.
- Rationalisation.
- The T, V, W distinction, with each limiting operation.
- The Mittag-Leffler bookkeeping used by SelmerIwasawaCohomology:L0.
- The corrected splitting-torsor formula, with its counterexample test.

## Remaining work

- **R02.1:** completed tensor products of coefficients with exactness hypotheses, for Iwasawa
  algebras.
- **R02.2:**
  - continuous Hochschild–Serre (Rubin Proposition B.2.5; Jannsen);
  - restriction/corestriction for compact coefficients;
  - Harpaz–Wittenberg's Remark 3.4 inputs.
- **R02.3:**
  - G_{F,S} and finiteness (Rubin Proposition B.2.7);
  - Euler characteristics and compact support;
  - the S-unit Kummer sequence.
- **R02.4:** Poitou–Tate (Milne, *Arithmetic Duality Theorems*, I §4), with its lattice and rational
  versions.
- **R02.5, R02.6, D7, D8:** as narrowed by RS-08.

## Sources

- K. Rubin, *Euler systems*, author draft.
- The Stacks Project, tags 0594, 0598, 07KW, 07KX, 07KY.
- Y. Harpaz and O. Wittenberg, *The Massey vanishing conjecture for number fields*, author final
  version.
