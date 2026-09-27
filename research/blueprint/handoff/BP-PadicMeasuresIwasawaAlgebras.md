# BP-PadicMeasuresIwasawaAlgebras — bounded Frobenius and psi

Codex — codex-7e92bd, 27 September 2026. **Partial checkpoint.** Refs #555.
Claim comment 5851669442 was confirmed by bot comment 5851670548; the whole issue
was reread unchanged. Input main: `0aad8cfa23dae904af6632d9d2d18b57ed6a7079`.
The 32 predecessor node objects and three source findings from the preceding
codex-a71f92/codex-hjdg0j checkpoints are preserved exactly.

## What is supplied

There are **22 new L2 declarations**, making **54 nodes**: 2 definitions,
10 constructions, 29 lemmas, 10 theorems and 3 comparisons. The packet has
**60 API entries, 41 definition/construction tests, 10 planets and 67 baseline
references**. The seed includes another ten comparison/boundary examples,
for 51 typed examples in total. There are eight gaps, no requests and no closed
stages. L2/L3 are partial; the other six stages retain their full targets and
not_read status. All implementation statuses remain unchecked.

The new dependency-closed subgraph supplies:

- The clopen set pℤ_p and its continuous exact-division function, extended by zero.
- Restriction to pℤ_p using the preceding weight operation; Frobenius as the
  existing pushforward by x↦px; psi as restriction followed by pushforward by
  exact division. These act on the existing AbstractMeasure carrier over every
  normed commutative coefficient ring. No measure value is divided by p.
- The identities ψφ=id and φψ=P, restriction to units E=id−P, its test-function
  support criterion and Eμ=μ iff ψμ=0.
- A finite Mahler expansion for x↦px, obtained on natural points by the binomial
  theorem and extended using density. This proves the exact integral Amice
  comparison Aφμ=(Aμ)((1+T)^p−1).
- Psi on integral power series by transport through the pinned Amice equivalence,
  its left-inverse identity and A(Eμ)=Aμ−φψ(Aμ). No multiplicativity is claimed.

The exact reusable suppliers include
`PadicMeasuresIwasawaAlgebras:L2/psi-phi`,
`PadicMeasuresIwasawaAlgebras:L2/phi-psi`,
`PadicMeasuresIwasawaAlgebras:L2/unit-support-psi`,
`PadicMeasuresIwasawaAlgebras:L2/amice-phi`,
`PadicMeasuresIwasawaAlgebras:L2/psi-series-intertwining`,
`PadicMeasuresIwasawaAlgebras:L2/psi-series-phi` and
`PadicMeasuresIwasawaAlgebras:L2/series-unit-restriction`.

## Source and ownership checks

Read the full owner document, all eight stage descriptions and touching stage
edges, all eight reviewed AUDIT-26 entries, the complete predecessor reader,
seed and handoff, and all touching link/overlap records. Accepted RS-16's own
layer decisions, the bounded-operator owner and direct links, and its topology
gate were checked. There is no integrated PMIA decomposition in the input.
WORKERS, both protocols, UPSTREAM_GUIDE and the previously read upstream
LocalFieldsRamification and Multiquadratic documents were byte-checked unchanged
within this session. Pinned Mathlib/Tau Ceti and other-packet searches found no
existing bounded phi/psi operator implementation supplying these declarations.

The current passage read is RJW's publication, printed pp.126–129 / PDF27–30,
read in full; the restriction and operator text was collated with arXiv v2
PDF20–21. Published p128 was rendered and inspected visually. The exact URLs,
SHA-256 digests and reading scopes are in the packet. The broader readings in
the predecessor remain explicitly attributed to their workers; this worker
makes no all-paper reading claim.

**E4** records the measure label in the ψφ calculation on published p128 and
v2 p21. After changing variables, the intermediate measure must be μ instead of
φμ. At p=3, μ=δ₁ and f=x, the printed intermediate integral is 3 whereas the
outside terms are 1. The theorem remains valid with this correction. A bounded
version/author-page/exact-title correction search found no correction; the
journal HTML route failed, while the publication PDF was available. The marker
new means no identified published correction, not historical priority. The
three inherited findings remain unchanged.

L2 owns bounded operators under RS-16. Coleman L1 owns the normalized finite-free
trace comparison; its determinant norm and arithmetic interpolation are not
assumptions here. Locally analytic and period-ring recipients own their own
carrier and topology comparisons. Generic clopen-subtype restriction belongs
to L0; the specialized ambient projectors here reuse the preceding L2 weight.
No backward dependency or new measure carrier was introduced. L2 now has six
planets, its limit; L3 retains four.

## Verification

The complete suggested file elaborates with Lean 4.34.0-rc2: **zero errors and
133 warnings, all permitted proof/data placeholders**. All 85 named declarations
and 51 examples have typed forms. All 2,070 reached Mathlib sources were
byte-compared against the pin before cached compiled libraries were used.
No Tau Ceti import is needed by this subgraph.

Twelve sensitive baseline signatures were inspected. Three separate scratch
checks prove, without placeholders, clopenness of pℤ_p, the actual pushforward
Dirac formula, and the direction of the Amice transport identity. The submitted
new declarations and proofs retain placeholders as required; those scratch
checks do not implement the full operator theory.

Exact finite arithmetic controls passed **3,501 assertions** at p=2,3,5:
Mahler dilation for integer arguments −16 through 23 and coefficients 0–14;
35 deterministic random atomic measures per prime; both composition identities,
unit support and idempotence, linearity, coefficientwise Amice substitution,
the polynomial psi identity, and the nonmultiplicativity/source-label controls.
These tests are not proofs of continuity, density or infinite-series statements.

The indexed blueprint checker reports zero errors and warnings; the official
four-file intake reports zero problems. Four source findings and both version
records pass the errata schema in a scratch wrapper. All predecessor objects,
new API/test names, reader statements and proof steps, source hashes and scoped
mutations pass the consistency checks. The internal graph has 84 edges and is
acyclic; there are no external node inputs to these conditional subgraphs.

The publication guard matched all 47 captured inputs and all four predecessor
outputs at main `132623f5dc647f6e6a19f8938695e7c09bbcd77b`; the issue and winning claim were unchanged.
The global source records and Coleman consumer were refreshed from main.
The changed record locators/corrections and ten new Coleman declarations were
screened: no E4 collision or bounded-operator ownership change was found.
Exactly the four issue-authorized files are submitted through Git Data REST;
no git command was used.

## Where to resume

1. Complete L2's generic clopen-subtype comparison with L0, unit dilations,
   multiplication by z^x with convergence hypotheses, inverse weighting on
   units and their relations. The current kernel-of-psi criterion is a support
   criterion on ambient measures; it does not by itself construct the comparison
   with AbstractMeasure on the separate unit subtype.
2. Extend the integral Amice equivalence to the correct bounded-series carrier
   for general coefficients, with explicit lattices, norms and weak topologies.
   The pinned inverse is integral only. A normed ring hypothesis for the present
   measure operations does not imply an inverse for every field-valued series.
3. Read/decompose the root-of-unity averaging formulas with actual coefficient
   extensions, convergence and descent. Coleman L1 consumes this bounded psi
   and proves its finite-free trace comparison. Import that comparison where
   appropriate; do not construct a second trace here.
4. Supply L1's completed-algebra comparisons by importing ProfiniteProPGroups
   Layer9. Retain the finite-quotient kernels ((1+T)^(p^n)−1), with coefficient
   reduction; do not identify them with pure T-adic kernels.
5. Resume L3 at positive-moment uniqueness, moment nonvanishing/regularity,
   the augmentation generator and actual admissible character specializations.
   Use a=p+1 in the corrected regularity proof and keep the dyadic torsion
   component integral. The existing generic algebraic evaluation is not a
   replacement for these arithmetic/topological comparisons.
6. Finish the source decompositions for L0, L0a and L4–L6 using the unchanged
   exact remaining lists. General Fitting/perfect-complex constructions retain
   their accepted owners; no stage is closed by this checkpoint.
