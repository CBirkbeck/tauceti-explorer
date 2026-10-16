# L4: families and operator theory — upstream ownership

This follow-up imports the existing plan in
[TauCetiRoadmap PR #854](https://github.com/TauCetiProject/TauCetiRoadmap/pull/854).
Its mathematical specification is the upstream
[Layer 4 README](https://github.com/TauCetiProject/TauCetiRoadmap/blob/fc6c8ae8b306e6d02566d030d5efcd56cef86cfe/TauCetiRoadmap/LocallyAnalyticDistributions/README.md#L1329),
at commit `fc6c8ae8b306e6d02566d030d5efcd56cef86cfe`, read on
2026-10-16. The upstream README remains authoritative as that pull request
develops. The immutable reference records what this ownership decision checked.

The maintainer had already identified this ownership in the
[2026-10-13 comment on #9294](https://github.com/CBirkbeck/tauceti-explorer/issues/9294#issuecomment-6147007852).
PROTOCOL §15 treats an open upstream roadmap pull request as existing work.
Consequently this packet adds no parallel definitions, theorem targets, APIs,
unit tests or planets. It records the disposition of the older follow-up's
obligations and preserves the hypotheses a consumer must check. This is a
completed ownership pass with coverage **planned**, without a claim that the
mathematics is implemented or independently verified.

The companion packet's `inheritedNodeDisposition` accounts for all 221 L4 node
IDs in the original packet. There are 177 direct upstream target matches and
44 other dispositions: renamed targets, supplier APIs, proof steps absorbed
into larger targets, a replaced proof route, existing library inputs and one
explicit scope restriction. Those IDs remain references to the original
packet; they are not redeclared here.

## Disposition of the inherited obligations

The following table follows the original packet's six remaining obligations.
It is an import guide, rather than a replacement specification of upstream.

| Inherited obligation | Existing owner and boundary |
| --- | --- |
| Entire spectral resultants and quantitative convergence; Coleman transport; finite-module topology and determinant rank over nonreduced coefficients | Upstream §§4.1, 4.3–4.4 and 4.9–4.14, using CompactOperators and RestrictedPowerSeries. Preserve the explicit finite rank and every-radius convergence hypotheses. |
| Completed tensors, analytic base change, the dual scalar-extension image and actual specialization | Upstream §0.0, §4.2 and §4.15. Analytic stages and their continuous duals have different coefficient conditions; a completed dual tensor equivalence needs its own hypotheses. |
| Universal-character charts, semigroup multipliers, common radii and destination-tail estimates | Upstream §4.15, with the arithmetic suppliers and torus comparisons in §4.17. Strict exponential convergence and the constructed action precede the compactness argument. |
| Numerical slope fibres, homotopy functoriality, perfect windows and derived base change | Upstream §4.16. The selected finite-slope complex, rather than the representative's raw characteristic product, carries the homotopy comparison. |
| Exact-slope rank and Euler characteristic on general affinoids | Upstream §4.16. The cutoff is rational and the numerical geometric points have rank one. Individual cohomology dimensions can jump. |
| Stein and inner-restriction comparison | The classical part is upstream §4.17, supplied by AdicSpacesPartIII §R3.4. Solid localization and reconstruction are excluded by this issue. |

For the first obligation, upstream's normalization and coefficient-ring
adapters use a general finite spectral-mapping supplier. The original packet's
generic-matrix, separability and eigenbasis proof route therefore introduces
no separate work here. A matrix's prescribed rank survives a drop in the
degree of its characteristic polynomial. Passing to reduced coefficients or
testing only split matrices would lose the required contract. The convergence
endpoint retains the zero constant coefficient of the functional input where
specified; coefficientwise convergence alone does not supply convergence in
every Gauss radius. The original smaller proof steps are indexed against the
target that absorbs them, without asserting that upstream declares each as a
separate lemma.

For the second and third obligations, the analytic Banach stage uses a c₀
coefficient model, while its dual uses bounded coefficient families. The
scalar-extension image condition and the actual coefficient specialization are
separate parts of the imported interface. A bounded coefficient homomorphism
carries a norm constant; an isometry is not automatic. The ring-general dual
construction needs explicit bounds on basis coefficients, and a projective
system can have a different bound at each radius. Each distribution module
used in Fredholm theory needs a justification of property (Pr); being a
continuous dual does not provide one. The common universal-character radius
retains the strict exponential convergence requirement at the dyadic boundary.
The cocycle and destination coefficient estimates remain part of the upstream
action construction, with arithmetic semigroup data supplied by its named
owners.

## The compact-complex finding

`RT-AREA-iwasawa-2/5` is handled by importing upstream §§4.16–4.17. These
sections already plan bounded Banach complexes, compact homotopy
endomorphisms through a degreewise compact representative, representative
characteristic products, numerical slope splittings, a finite perfect model,
the concentrated-complex comparison, homotopy functoriality and derived base
change. Thus the finding creates no additional local targets.

The representative characteristic product can change on a contractible
complex. This import does not promote it to a homotopy invariant, nor infer
invariant spectral support from it. Finite-slope comparisons use the selected
split finite complex. Derived base change of that complex and underived base
change of its cohomology have different hypotheses. The rank-one fibre and
inclusive endpoint conventions remain those of the upstream specification.

The Stein input also has a precise boundary. A Fréchet presentation alone
does not supply compact transitions or the operator factorizations through
them. The chosen coefficient norms and the comparison between closure-proper
and Kiehl compactness criteria remain required inputs. The old
AdicSpacesPartII R3 pointer is superseded here by upstream's current
AdicSpacesPartIII §R3.4 supplier. The imported output consists of classical
finite windows. It makes no claim to the solid-module reconstruction theorem,
and ordinary inversion or a union of windows does not establish that theorem.

## Sources and acceptance of this handoff

This pass read the upstream README and suggested file. It does not claim a
fresh verification of their primary papers. For readers following the source
lineage, the upstream targets locate Coleman, Appendix A3, Lemma A3.8 and
Theorem A3.9, pp. 435–436; Urban, Lemmas 3.4.6–3.4.7 and Corollary 3.4.10,
pp. 43–45; Pilloni, §13.1.1 and Proposition 13.1.3.1, pp. 84–85; BCGP I,
§6.1.1, p. 139, and Theorem 6.3.16, pp. 152–153; and BCGP II,
Definition 2.2.17, p. 21, and §§4.6.46–4.6.49, pp. 93–95. Coleman
Proposition A5.5 and Corollary A5.5.1, pp. 441–442, are part of the
upstream lineage for local Fredholm windows, not by themselves the full
general-affinoid exact-slope assertion.

The packet fixes the upstream commit and content hashes, records each
inherited node's disposition and identifies the excluded solid portion.
Its acceptance checks require that every inherited L4 ID appear exactly
once, that its upstream target locator exist at the recorded commit, and
that all six obligations and the compact-complex finding be accounted for.
Mathematical definitions, their API tests and the roadmap's acceptance
examples remain at their upstream owner. The companion Lean file therefore
contains only an individual native module import and an ownership note. Its
successful elaboration checks the file's import; it supplies no theorem
validation. Changes to the mathematical specification belong on upstream
PR #854. No second L4 blueprint or package should be generated from this pass.
