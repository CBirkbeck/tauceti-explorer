# Reconstruction and rational-point outputs: ownership of NC.6

NC.6 adds a publication step to the mathematical outputs of NC.1–NC.5.
The proposed change removes that step from the mathematical roadmap. Curve
reconstruction remains in NC.1; quadratic Chabauty supplies its equations
directly from NC.5 to EffectiveDiophantineMethods ED.6. This document describes
the interfaces that must survive removal. It supplies no new definition,
construction, theorem or planet.

The proposal is pending. The [scoped packet](../packets/AnabelianGeometryAndNonabelianChabauty--NC.6.json)
has partial coverage because an accepted restructuring has not yet dropped
NC.6. This status concerns removal of the process stage; it neither closes nor
reopens the mathematical planning obligations of its suppliers.

## Owners and consumers

Use NC below for AnabelianGeometryAndNonabelianChabauty and ED for
EffectiveDiophantineMethods. The objects in this table are the actual geometric
objects required by their owning layers; they are not replacement structures
introduced by NC.6.

| Output formerly listed in NC.6 | Mathematical owner | Interface preserved for its users |
| --- | --- | --- |
| Profinite reconstruction | NC.1 | Source-qualified curve isomorphisms from continuous geometric fundamental-group isomorphisms, modulo inner automorphisms, compatible with the outer action of the fixed base field's Galois group. |
| Unipotent groups and comparisons used by the other exports | NC.2 | Finite-level étale and de Rham groups and path torsors, with their Galois, Frobenius and filtration data and the relevant comparison maps. |
| Selmer varieties | NC.3 | Actual geometric torsor parameter spaces, their local conditions at the specified places, and localization morphisms. |
| Iterated-integral equations and general Chabauty–Kim loci | NC.4 | The unipotent Albanese map, compatibility with localization/comparison, global-point inclusion and source-qualified finiteness results. |
| Quadratic equations and finite depth-two loci | NC.5 | Height equations, the allowed local height values away from p, and the precise rank, Picard-number, logarithm and reduction hypotheses. |
| Precision and rational-point certification | ED.6 | Computable finite data for the equations, exhaustive root/disc certification and comparison with exact global points; ED.5 supplies sieve exclusions. |

The [parent packet](../packets/AnabelianGeometryAndNonabelianChabauty.json)
contains the existing NC.3/torsor-classification node. Its topological torsor
classification is useful support for H¹; the node's own scope does not include
representability of geometric Selmer varieties or their local conditions.
The parent leaves reconstruction, unipotent comparisons and quadratic Chabauty
as separate remaining work. They cannot be treated as ready APIs merely by
listing their outputs here.

The [ED packet](../packets/EffectiveDiophantineMethods.json) identifies the
consumer interfaces through ED.6/certified-solution-set,
padic-candidate-comparison, qc-disc-certificate, qc-certificate-sound,
height-series-valuation-bound, root-determination-precision and
qc-modular-algorithm. Its latest review is needs_changes
(REV-EffectiveDiophantineMethods~3, 8 October 2026). These references establish
ownership and expose outstanding geometric/numerical interfaces; they do not
certify that the suppliers or computations have been implemented.

## Reconstruction retains its own scope

For smooth proper geometrically connected curves of genus at least two over a
fixed number field K, the closed-curve reconstruction target concerns the
natural map from K-isomorphisms to outer Galois-compatible isomorphisms of the
geometric profinite fundamental groups. The profinite maps must be continuous,
and the quotient by geometric inner automorphisms is part of the target.
[Mochizuki, Theorems 10.1–10.2, §10, pp.624–626](https://www.ms.u-tokyo.ac.jp/journal/pdf/jms030305.pdf)
supplies this Isom scope. The rational-base-point formulation of Theorem 10.1
and the outer formulation of Theorem 10.2 have distinct inputs; a Hom variant
requires a separate source and remains NC.1's responsibility.

This output reconstructs isomorphisms between curves from the prescribed
group data. Turning a conjugacy class of a section into a rational point is a
separate assertion. The map from rational points to section classes is
constructed in NC.0; its claimed general bijectivity remains the section
conjecture. See [Kim, introduction, pp.89–90](https://ems.press/content/serial-article-files/41066?nt=1).
An enumeration algorithm receives no extra proof of completeness from the
reconstruction theorem.

## Equations retain their geometric meaning

A consumer must retain the base field, the chosen place above p, the curve and
its model, base point, finite unipotent quotient/depth, allowed bad places and
the precise local Selmer conditions. Rational points on a proper curve and
integral points on a specified open model are different inputs. Their
global-to-local images must agree with the corresponding unipotent Albanese
map and comparison maps; an unrelated function with the same numerical values
at sampled points does not supply these maps.

The required inclusion of the specified global points in the local locus is
the content carried through the diagram in
[Kim, introduction, pp.94–96](https://ems.press/content/serial-article-files/41066?nt=1).
The dimension inequality of his Conjecture 1 is a condition leading to
finiteness, distinct from an equality with the global set.
When a route uses Bloch–Kato, Fontaine–Mazur or another unproved input, that
input must remain in the hypotheses of NC.4/NC.5 and every consumer.

NC.5 must export the complete family of quadratic equations, the finite
alternatives for local heights away from p, and the domains where those
equations are valid. Rank equal to genus does not alone establish the needed
p-adic logarithm condition. The scope distinctions and finite local-height
alternatives are visible in
[Balakrishnan–Dogra, Theorem 1.2 and Remark 1.3, preprint v2, p.4](https://arxiv.org/pdf/1601.00388v2).
Any excluded correspondence support, missing affine patch or exceptional
point remains a coverage obligation at its owner.

For the stringent local conditions and minimal integral model used by BDCKW,
eventual equality with the global integral points is their §3.1 conjecture;
§3.2 expressly leaves a general number-field formulation open.
See [BDCKW, §§2.7 and 3.1–3.4, preprint v4, pp.10,12–13](https://arxiv.org/pdf/1209.0640v4).
An arbitrary family of Selmer conditions cannot inherit that assertion.
Finiteness at one depth, decreasing loci and conditional dimension estimates
each remain distinct from eventual equality.

## Precision and global comparison stay in ED.6

The consumer needs the actual equations on every relevant residue disc, the
coordinate changes connecting them to the curve, finite coefficient
approximations, tail bounds and certified output precision. It must account
for losses in integration, Frobenius/parallel transport and height-pairing
linear algebra. A semantic finite set or an assumed root-covering proof cannot
substitute for finite certificate data and a sound verifier.

The separation between candidate output, failed computation and subsequent
sieving is explicit in
[BDMTV, Algorithm 3.12, Remarks 3.13–3.16 and §3.5.1, published pp.1124–1126](https://doi.org/10.1112/S0010437X23007170).
The following checks belong to the ED.6 producer/verifier and its owners:

- Every global point is in a covered patch and allowed height case. Omitted
  discs or exceptional points keep the computation open.
- Coefficient errors and every tail index satisfy the bounds needed for the
  chosen root precision. Multiple roots or unseparated root clusters need
  their own root-count/isolation argument.
- Each surviving ball is matched with an exactly verified global point, with
  the requisite uniqueness, or excluded by a valid global/local certificate.
  A finite p-adic candidate set alone gives no exact rational-point list.
- A failure or unresolved hypothesis remains visible in the result; neither
  becomes an empty solution set.

The ED supplier already records a truncation-condition problem at
EffectiveDiophantineMethods/E21 and a preprint branch misprint at E30.
The packet records those existing findings in its own words, with their
provenance, after comparing the selected published and preprint passages.
Use the all-tail condition required by truncation, not merely the printed
equality-index condition in
[BDMTV, Lemma 4.7, published p.1136](https://doi.org/10.1112/S0010437X23007170).
The eventual phi branch is corrected in the published text at that page;
this checkpoint makes no new root-isolation theorem or numerical replay claim.

## Graph change and existing upstream ownership

The atlas currently has NC.1 → NC.6 and NC.5 → NC.6, with no consumers of
NC.6. It also already has NC.5 → ED.6. The restructuring proposal therefore
drops NC.6 and its two incoming edges while preserving NC.5 → ED.6. The
existing NC.2 → NC.3 → NC.4 → NC.5 chain carries the unipotent inputs.
No new reconstruction-to-enumeration dependency is warranted by the current
ED.6 algorithm.

Current upstream ProfiniteArithmetic owns generic continuous automorphism and
outer-automorphism APIs in Layer 2. Completed EffectiveBounds owns its
effective arithmetic bounds; current Tau Ceti has general adic
power-series-evaluation results. This proposal introduces none of those
objects. The packet records the inspected upstream/library commits and the
reading extent separately from the blueprint's pinned baseline.

NC.6 has zero new mathematical nodes, APIs, typed tests, baseline declarations
and planets. Definition and construction tests stay with their mathematical
owners. The [Lean companion](../suggested/AnabelianGeometryAndNonabelianChabauty--NC.6.lean)
contains comments only; its elaboration tests no mathematical assertion.
Removal can be marked closed without nodes only after the accepted
restructuring required by PROTOCOL §15.
