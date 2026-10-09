# Independent review of SF.5

Accepted the corrected packet as a completed target-level planning pass. Reviewed by Codex, session `codex-h5zWEh`, on 2026-10-09 for issue #6287; this session did not write the original plan. Acceptance does not assert proof closure or formalisation.

The reviewed packet has **83 nodes: 36 verified, 44 corrected, 3 added, 0 unverifiable**. Its node-level verdicts are in `review.checked`. It contains 11 definitions, 25 constructions, 46 theorems and one lemma, with 119 API items, 109 unit-test specifications and six planets. All 19 baseline citations and all 18 source-issue findings are confirmed. SF.5 remains `planned`; the packet's `complete` status denotes a finished pass. Twelve explicit gaps and ten supplier requests prevent a `closed` claim.

## Mathematical corrections

The principal dependency correction is an acyclic chain: affine-space-bundle **surjectivity** → projective-bundle formula → vector-bundle **bijectivity**. Ordinary Chow localization gives surjectivity, not injective gluing. Stacks Lemma 42.32.1 (02TT), p. 58 and Lemmas 42.36.1–3 (02TW–02TY), pp. 70–72 provide this route. The broader affine-space-bundle injectivity assertion needs the higher-Chow localization input described in Remark 42.32.8, pp. 61–62; that input is now an explicit gap.

Gysin interchange uses bivariant integral-support detection, proper birational blowups, the excess formula and Cartier/Chern commutation: Stacks Lemmas 42.35.3 (02UC), p. 67 and 42.54.8 (0FBP), pp. 124–125. Composition uses the original dual normal sequence, then makes both pulled-back centres Cartier and compares their normal cones using Lemmas 42.54.9–10 (0FEB, 0FEC), pp. 125–126. The source's omitted affine-chart calculations remain identified as a gap. An unspecified two-parameter deformation argument no longer stands in for either proof.

The suggested signatures now attach finite-flat degree, bundle rank, graph degree, curve genus, field cardinality and homogeneous polynomial degree to the geometry they describe. Native field-linearity, finiteness, characteristic, smooth relative dimension, finite presentation and local freeness are stated wherever they express the needed conditions. Projectivity, induced dimension compatibility, regular/Cartier immersions, geometric connectedness and several source-specific constructions still require the named supplier interfaces. Their omission is stated locally; the weakened prototypes are not implementation theorems.

Mixed quotients use algebraic-space presentations on the SF.1 carrier. Their stack shifts use actual scheme/group dimensions. The BGm and Bμn tests now specify integral polynomial-ring multiplication, the existing direct-sum addition, unit and universal Chern generator; Bμn is over ℚ, with integer coefficients. Scheme and DM intersection-ring specifications likewise identify their diagonal product and fundamental unit rather than accepting an arbitrary ring instance. The projective-bundle classifier uses quotient-line pairs modulo isomorphism intertwining the quotient maps. Rational equivalence now has a locally finite family constructor and a countable disjoint-union P¹ test.

The three additions are target-level inputs needed by existing targets:

| Node | Source and purpose |
| --- | --- |
| `affine-bundle-surjectivity` | Stacks 42.32.1 (02TT), p. 58 gives the precise surjectivity input needed by the projective formula without assuming injective gluing. |
| `bivariant-chow` | Stacks 42.33.1 (0B76), pp. 62–63 and 42.34.1 (0B7E), p. 64 supply the family construction and operational ring. Added native additive family/subgroup forms, cap, extensionality, restriction, bilinear composition, cap simp API and three tests. |
| `bivariant-detection` | Stacks 42.35.3 (02UC), p. 67 supplies integral-test and proper-birational detection; its proof uses a locally finite coproduct of closed supports, including non-quasi-compact tests. |

## Every correction

Each row records a change to an original node or its suggested signatures. Unchanged statements and their sources were also checked; their individual verdicts are recorded in the packet. Header edits consistently identify the reviewed packet as the reference while the older reader awaits regeneration.

| Node | Change |
| --- | --- |
| `coherent-cycle` | The exact-sequence API now states native local Noetherianity and finite presentation of all three terms; the common support bound remains explicit supplier scope. Packet fields: prototypeLimitations. |
| `locally-finite-principal-boundary` | Family data now bind the generic support dimension to d+1; the native finite-support principal-divisor API remains an input to a locally finite extension. Packet fields: prototypeLimitations. |
| `rational-equivalence` | Added the locally finite family constructor and the countable disjoint-union P¹ test that rejects finite-only rational relations. Packet fields: api, tests. |
| `finite-flat-degree` | Corrected the copied hypothesis list and bound n to the actual finite locally free rank, with native finite and flat conditions. Packet fields: hypotheses, prototypeLimitations. |
| `chow-localization` | The open immersion is now required to have image complementary to the closed immersion in the suggested exactness statement. Packet fields: prototypeLimitations. |
| `affine-bundle-homotopy` | Removed the injective-gluing claim; vector-bundle injectivity now follows from the projective formula. General affine-space-bundle injectivity has its own higher-Chow gap. Packet fields: proofSteps, prerequisites, prototypeLimitations, upstreamImports. |
| `first-chern` | Imported current AlgebraicVectorBundles tensor/dual operations; historical baseline comments no longer imply that those operations are absent today. Packet fields: upstreamImports. |
| `chern-commutation` | Replaced the unrelated finite-flat hypotheses by the actual dimension-base and invertible-sheaf hypotheses. Packet fields: hypotheses. |
| `chern-flat` | Replaced the unrelated finite-flat hypotheses and corrected the acceptance example for the flat Chern grade shift. Packet fields: hypotheses, acceptance. |
| `projective-bundle` | Added the quotient-line universal property modulo intertwining line isomorphisms and current upstream bundle imports. Packet fields: api, prototypeLimitations, upstreamImports. |
| `projective-bundle-formula` | Added affine-bundle surjectivity, Cartier Gysin and Chern projection; its proof does not depend circularly on vector homotopy. Native finite local freeness and actual rank are explicit. Packet fields: proofSteps, prerequisites, prototypeLimitations. |
| `flag-bundle` | Bound rank-sensitive injectivity to native finite local freeness and actual rank, and imported existing bundle operations. Packet fields: prototypeLimitations, upstreamImports. |
| `chern-operators` | Added the bivariant construction and integral-support detection as direct inputs. Packet fields: prerequisites. |
| `whitney` | Added native finite local freeness of all terms of the exact sequence in the suggested theorem. Packet fields: prototypeLimitations. |
| `normal-cone` | Imported current relative Spec and geometric bundle conventions rather than requesting them as new SF.0 work. Packet fields: upstreamImports. |
| `gysin-flat` | Corrected copied hypotheses and the false identification of 42.48.4 as flat specialization; cited the bivariant construction 42.54.2 (0FBK). Packet fields: hypotheses, proofSteps, acceptance, prerequisites, sources. |
| `gysin-interchange` | Replaced an unsupported double-deformation route by integral detection, proper birational blowups, excess, Cartier commutation and central Chern operations. Packet fields: proofSteps, prerequisites, sources. |
| `gysin-composition` | Used the actual dual normal sequence, Cartier nested-cone identity 42.54.9 (0FEB), and excess reduction of 42.54.10; the omitted chart calculation remains a gap. Packet fields: proofSteps, prerequisites, sources, prototypeLimitations. |
| `exterior-product` | Bound the inseparable multiplicity test to a finite purely inseparable extension of the stated degree. Packet fields: prototypeLimitations. |
| `smooth-intersection` | The proposed ring now fixes the existing direct-sum addition, homogeneous diagonal multiplication and fundamental unit; native smooth dimension and field scope are explicit. Packet fields: api, prototypeLimitations. |
| `isolated-plane-bezout` | The suggested forms are nonzero homogeneous polynomials of the stated positive total degrees over an algebraically closed field. Packet fields: prototypeLimitations. |
| `finite-resolutions` | Resolution terms are now native finite locally free modules, and the smooth dimension, finite-presentation, boundedness and homology comparison conditions are explicit. Packet fields: prototypeLimitations. |
| `koszul-character` | Bound r to the actual finite locally free bundle rank, with native smooth dimension and field scope; the regular Koszul supplier remains recorded. Packet fields: prototypeLimitations. |
| `zero-section-rr` | Added the finite-resolution prerequisite, native source scope and actual bundle-rank output grading. Packet fields: prerequisites, prototypeLimitations. |
| `regular-embedding-rr` | Added the native common field, field-linearity, smooth relative dimensions and finite presentation of the coherent input. Packet fields: prototypeLimitations. |
| `projective-grr` | Added the native common algebraically closed field, field-linearity, properness, smooth dimensions and coherent input; projective/quasiprojective scope remains explicitly omitted. Packet fields: prototypeLimitations. |
| `hirzebruch-rr` | Added native algebraically closed field, properness, smooth dimension and finite presentation; true Euler finiteness remains a supplier condition. Packet fields: prototypeLimitations. |
| `very-ample` | Closed restriction now states native field-linearity of the immersion. Packet fields: prototypeLimitations. |
| `ample` | Closed restriction now states native field-linearity of the immersion. Packet fields: prototypeLimitations. |
| `surface-weak-rr` | Identified K with the canonical line and added native integral smooth proper surface scope over an algebraically closed field. Packet fields: prototypeLimitations. |
| `surface-rr` | Identified K with the canonical line and added native integral smooth proper surface scope; coherent duality remains imported from SF.2. Packet fields: prototypeLimitations. |
| `hodge-index` | Added native integral smooth proper surface scope over an algebraically closed field; retained the separately recorded numerical-quotient gap. Packet fields: prototypeLimitations. |
| `hodge-cauchy` | Added native integral smooth proper surface scope; Milne 11.54 has a one-way implication, confirmed visually, so no false iff source issue was added. Packet fields: prototypeLimitations. |
| `curve-product-graphs` | Bound the map degree and genus to their geometric constructions, using native finite field-linear maps of smooth proper curves. Packet fields: prototypeLimitations. |
| `frobenius-fixed-points` | Bound q to the finite field cardinality and stated native smooth proper curve scope; actual Frobenius, extension fields and geometric connectedness remain SF.3 inputs. Packet fields: prototypeLimitations. |
| `weil-bound` | Bound q to the field cardinality and g to native H¹ dimension, with smooth proper curve scope, retaining every r≥1. Packet fields: prototypeLimitations. |
| `mixed-quotients` | Changed the quotient carrier from a forced scheme to an SF.1 algebraic-space presentation; corrected actual dimension shifts and strengthened BGm/Bμn tests to integral ring equivalences with their Chern generators. Packet fields: sources, api, prototypeLimitations. |
| `dm-gysin-ring` | Required the proposed ring to have native addition, the specified diagonal product and fundamental unit rather than merely some commutative ring structure. Packet fields: prototypeLimitations. |
| `frobenius-descent` | Added prime p, native CharP, proper field bases, finiteness and field-linearity; the universal-homeomorphism scope is still explicitly required. Packet fields: prototypeLimitations. |
| `semiample-gluing` | Added native positive characteristic, proper field bases and field-linearity; reduced/conductor, connectedness and normality conditions remain precise suppliers. Packet fields: prototypeLimitations. |
| `ample-effective-semiample` | Added a positive tensor-power decomposition into an ample line and the divisor line; native characteristic/proper scope is explicit and the Cartier condition remains required. Packet fields: prototypeLimitations. |
| `keel-semiampleness` | Added native prime positive characteristic and proper field scope without imposing smoothness or bigness. Packet fields: prototypeLimitations. |
| `finite-field-semiampleness` | Required an algebraically closed algebraic extension of a prime finite field; arbitrary positive characteristic is insufficient for the torsion step. Packet fields: prototypeLimitations. |
| `keel-characteristic-zero` | Required characteristic zero, algebraic closure, smooth proper curve scope and genus≥2; the self-product is the actual fibre product over that field. Packet fields: prototypeLimitations. |

## Baseline and ownership

All sixteen original citations remain valid at Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` and Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`; none was removed or renamed. Three checked native predicates were added: `SheafOfModules.IsLocallyFree`, `SheafOfModules.IsFinitePresentation` and `MvPolynomial.IsHomogeneous`. The per-declaration confirmations in `review.baselineChecked` record the relevant hypotheses and conventions. The module category includes all structure-sheaf modules; the cycle carrier is locally finite; native Weil divisors/principal divisors are finite-support interfaces; the Euler helper is a finite-cutoff sum whose interpretation still needs cohomological finiteness and vanishing.

The reviewed library audit was checked for duplication. Graded Chow groups, rational-equivalence descent and intersection theory extend existing cycles and divisors. They do not recreate those carriers or scheme cohomology. Existing coherent duality is imported through `SchemeAndStackFoundations:key/coherent-duality`, `SF.2/smooth-proper` and `SF.2/serre-proper`, whose proper and smooth-proper statements were read. The scheme GRR route remains smooth projective/quasiprojective and rational; it does not supply singular, nodal-family or stack GRR.

Current [AlgebraicVectorBundles L0–L2](https://github.com/TauCetiProject/TauCetiRoadmap/tree/de435a569d325b365a30fe83269ce34674eaea80/TauCetiRoadmap/AlgebraicVectorBundles) already plans module monoidal structure, finite locally free rank, tensor/dual/polynomial operations, relative Spec and geometric total spaces. Those README and suggested declarations were read. The current library also supplies line tensor/dual/pullback and relative Spec at Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. SF.0/SF.3 requests now ask for adapters and additional relative-Proj/Chow infrastructure, not duplicate bundle or relative-Spec developments. The exact current revision, layer imports and consuming nodes are recorded separately from the old pinned baseline. The atlas snapshot cannot resolve these newer layers as ordinary edges yet; this is registration bookkeeping for the orchestrator.

Current StableReduction Layer 4 was checked for its general blowup API, flat base change, strict transforms and arithmetic surface pairing. It supplies the blowups and arithmetic comparison used here. RT-AREA-algebraicgeometry/15 is satisfied in the packet and the existing reader's ownership discussion: SF.3 and coherent duality replace the blanket SF.4 input; SF.5 owns the projective/flag and positivity additions needed below arithmetic moduli. Néron models, abelian semistable reduction and StableReduction Layers 7–9 are not blanket SF.5 inputs. Higher consumers import the foundational additions from SF.5. Current upstream bundle infrastructure remains with AlgebraicVectorBundles.

## Sources and source issues

All eleven public source files were acquired in scratch and matched their recorded SHA-256 hashes. Source URLs, versions and precise read ranges remain in the packet. The review checked the locators used by all nodes, including visible mathematical symbols when text extraction was ambiguous. No source passage or private file is included in this submission. Fulton was not used: no cleared full edition was available. The 1958 Hodge material was checked only in the public 2022 transcription, and its findings remain explicitly scoped to that transcription until the original is collated.

All fourteen original findings were independently confirmed, including the following correction to their interpretation: Krämer III.6 Theorem 6.2(d), p. 99 uses `e` for the pulled-back regular codimension. The excess rank is `d−e`, so the total grade loss is `d`, not `d+e`. Milne Theorem 11.54, p. 37 displays a one-way implication; a text-extraction ambiguity does not establish an additional source error.

Four further Stacks proof misprints were recorded and confirmed, against chapter revision `ed88ff78` and the live tag pages. No matching correction appeared in the tag/section comments checked on 2026-10-09:

| Finding | Locator | Correction |
| --- | --- | --- |
| E-SF5-15 | 42.36.3 (02TY), p. 72 | The uniqueness reference is 42.36.2; the ambient Chern expression uses the line on the projective bundle. |
| E-SF5-16 | 42.36.1 (02TW), p. 70 | The inverse-image support dimension includes the base dimension: `k+r−1`. |
| E-SF5-17 | 42.54.9 (0FEB), p. 125 | The two Cartier operations lower grade to `n−1`; use the strict transform before specialization and the cone of Z in X in the second calculation. |
| E-SF5-18 | 42.54.10 (0FEC), p. 126 | The complementary exact sequence starts on Y; retain the dual normal kernel and the dual of the conormal bundle in the reduction. |

## Remaining work and orchestrator actions

The twelve gaps name tame reciprocity/nested-cone charts, general lci gluing, moving/local Tor comparison, asymptotic RR/Kodaira decomposition, contraction/formal descent, the finite universal-homeomorphism exponent, conductor/Picard boundedness, stack local Gysin/rational proper push, stack RR, numerical Hodge signature, source collation and general affine-space-bundle injectivity. Each must be resolved with the stated hypotheses before the corresponding target is implemented or the stage is called closed. Kresch's integral projective push does not establish unrestricted nonrepresentable integral degree; the rational comparison supplier is retained.

The reader `research/blueprint/readmes/SchemeAndStackFoundations--SF.5.md` is an input outside this review issue's deliverable paths. It was read, including the red-team ownership correction, but it still contains the old affine-bundle and double-deformation routes and historical supplier discussion. The orchestrator/assembly/package job must regenerate it from this reviewed packet before treating it as the corrected roadmap text. Register the current AlgebraicVectorBundles layers and turn the recorded imports into ordinary graph edges when refreshing the snapshot. These actions are also in the handoff; no atlas data or another job's files were edited.

## Validation

`python3 scripts/check_blueprint.py research/blueprint/packets/SchemeAndStackFoundations--SF.5.json`: **0 errors, 0 warnings**. The source-issue and source-version validators also report no errors. `lean-check research/blueprint/suggested/SchemeAndStackFoundations--SF.5.lean` elaborates at the pinned shared baseline with **only declaration-uses-sorry warnings**. This checks the forms and types, not proofs of the planned mathematics. `git diff --check` passes. Every packet API/test name has a corresponding form or named test comment in the suggested file. No Lean server, library build, update or cache fetch was used.
