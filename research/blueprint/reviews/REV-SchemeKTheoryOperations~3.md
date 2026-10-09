# Independent review: REV-SchemeKTheoryOperations~3

**Verdict: accepted**, 9 October 2026. Reviewer: Codex, GPT-6, session `codex-5jepAB`; independent of all three blueprint authors. This completes the review of issue #7553. Acceptance concerns the correctness of the target-level plan with its explicit conditional inputs; it does not certify implementation or proof closure.

The ample-family correction resolves the two previously unverifiable global model contracts. All 35 round-2 accepted corrections remain present. This review applies 20 further node corrections, refreshes the entire per-node audit, checks the 51 inherited source findings, and adds 11 findings. The packet, reader and suggested contract catalogue agree.

## Counts and scope

| Item | Result |
| --- | --- |
| Nodes | 284: 264 verified, 20 corrected, none added or unverifiable |
| Kinds | 29 definitions, 37 constructions, 83 lemmas, 95 theorems, 24 comparisons, 16 applications |
| Public sources and node citations | 32 sources; 652 citation entries, including repeated locators |
| Pinned baseline | All 134 declarations confirmed; none removed or renamed |
| Distinct external prerequisites | 137: 116 node statements and 21 stage contracts; upstream Tau Ceti overlaps checked separately |
| APIs and tests | 459 API specifications and 295 test specifications across all nodes; validator counts 445 and 286 on its narrower eligible set |
| Planets | 40, retained; no source-locator planet names added |
| Coverage | S.1–S.7 planned; zero proof-closed stages; every implementation unchecked |
| Gaps and requests | 42 gaps and 42 supplier requests, retained with two gap descriptions made more precise |
| Source findings | 62: 59 confirmed, E4/E5/E41 rejected; E52–E62 added |

The `complete` status means one finished target-level planning pass. All stage targets are realised, and their prerequisite chains terminate in pinned declarations, named supplier contracts or explicit gaps. No outstanding source gap is silently treated as a proof. The reviewed library audit and RS-18 ownership boundaries do not reveal a duplicated planned library declaration.

## Round-2 correction and global scope

The [round-2 review](REV-SchemeKTheoryOperations~2.md) required either a new unrestricted perfect-complex K-coherence proof or a consistent ample-family restriction. Revision 3 chooses the latter. The sheaf model, K-coherence and all dependent higher scheme operations now require regular noetherian schemes of finite dimension with an ample family. Abstract λ-algebra and vector-bundle K₀ retain their independent generality.

[TT](https://gwern.net/doc/math/1990-thomason.pdf) 2.1.1–2.1.2, printed pp.283–284, and 3.8–3.10, p.316, supply this natural vector-bundle/perfect-complex comparison. Opens, affine morphisms and quasi-projective auxiliary schemes preserve the required family by 2.1.2(e),(g),(h); regular separated schemes qualify by (d). These checks cover localisation, support neighbourhoods, finite étale maps, flag bundles and deformation constructions. The two former `unverifiable` nodes are justified at their repaired scope.

The doubled affine line has affine diagonal and an ample family, by [Stacks 0GML](https://stacks.math.columbia.edu/tag/0GML). The doubled affine plane has the incompatible K₀ models in TT Exercise 8.6, printed p.374, PDF p.128; the earlier review’s p.376 locator was inaccurate. The plane is excluded by the current operation scope. Local affine comparison alone is not used to infer a global equivalence.

All twelve previously disputed routes were rechecked: supported compact factorization, the exact graded filtration, finite-dimensional coniveau and proper support estimates, power-series coordinates, global operation homotopies, rational support weights, finite-coefficient endpoints, the unstable Brown fringe, mixed-characteristic group effacement, integral leading Chern classes, geometric GRR and dimension-one G-cycles. Their repaired hypotheses and supplier requests remain explicit. In particular, the support cofiber uses D=max(dim X,dim(X∖Y)+1), the stability range reaches m+D+1, individual γ-operation vanishing is not substituted for the full weighted-module filtration, and the finite-coefficient argument excludes degree one. Borel–Serre geometric GRR remains over algebraically closed fields. No new unrestricted extension is inferred.

## Corrections applied

The following identifiers omit the `SchemeKTheoryOperations:` prefix. Each row is marked `corrected` in the packet; the other 264 nodes have fresh `verified` records.

| Node | Correction |
| --- | --- |
| `S.1/perfect-derived-pullback` | Require a K-flat representative for underived pullback to compute derived pullback; bounded-above flat representatives suffice. Termwise flatness alone is not the unbounded criterion. |
| `S.2/g-theory-models` | Separate local pseudo-coherence from a global vector-bundle resolution, and identify the bounded-below flasque submodel used for proper transfer. |
| `S.2/g-theory-proper-pushforward` | Use bounded-below flasque representatives for the elementary acyclicity argument; broader unbounded deployment requires TT B.11. |
| `S.2/k-theory-proper-pushforward` | Specify the bounded-below flasque perfect submodel on which termwise direct image represents Rf_*. |
| `S.2/pushforward-functoriality` | Keep the composed pushforward argument in the bounded-below flasque models already selected. |
| `S.2/k-theory-base-change` | Correct the simultaneous deployment model: E is deployed for f_* and g′*, F is bounded-above flat and G bounded-below flasque, as in TT 3.18. |
| `S.2/affine-pushforward-is-transfer` | Distinguish K(H(A)) from homotopy K-theory KH(A), and replace the incorrect finite-G-transfer citation by the remark following V.3.5. |
| `S.3/affine-support-comparison` | Replace the false categorical identification with the K-theory dévissage equivalence; supported perfect complexes are not the coherent category of R/s. |
| `S.4/brown-gersten-vanishing` | Repair the induction on the complement inside the varying open, and efface the codimension-d generic points one at a time. Do not require a single neighbourhood to annihilate a at every generic point. |
| `S.4/gersten-conditions-equivalent` | Include the missing (ii) ⇒ (iii) implication by identifying the positive-column E₂ groups with Gersten-row homology and the edge map with the augmentation. |
| `S.4/quillen-presentation-lemma` | Use Quillen’s normalization lemma over every field; its finite-field proof does not require an additional uniform transfer argument. |
| `S.4/quillen-effacement` | Remove the unnecessary finite-field transfer step: finite-stage descent of one K-class does not yield a uniform annihilation stage for an entire K-group. Quillen 5.12 already covers all fields. |
| `S.4/gillet-levine-smooth-over-dvr` | Exclude t=0 by requiring a nonzerodivisor; otherwise the displayed base-change map can be the identity on K₀. Keep the unread relative presentation theorem as an explicit source gap. |
| `S.5/mumford-regularity` | Distinguish the coherent regular-sheaf exact category from its vector-bundle subcategory and the perfect-complex model. |
| `S.5/quillen-resolution` | Type the vector-bundle K₀ resolution map on MR_VB; its coherent version maps to G₀, and its perfect-complex version maps to perfect K-theory. |
| `S.6/representation-classifying-map` | Keep the stable target as an inverse limit of finite-rank homotopy classes. No identification with genuine self-map classes is made without a phantom-control input; normalize q on trivial representations. |
| `S.6/quillen-hiller-operations` | Add Hiller universality as the explicit lifting/uniqueness prerequisite before defining composition on arbitrary pointed spaces. |
| `S.6/quillen-hiller-special-lambda` | Use the conditional Hiller uniqueness input for identities of genuine maps, rather than concluding equality solely from finite-rank restrictions. |
| `S.6/degree-zero-comparison` | Require a regular quasi-projective example, and restrict the determinant/top-exterior assertion to actual projectives rather than virtual classes of rank r. |
| `S.7/grothendieck-riemann-roch` | Extend the Borel–Serre proof locator through the actual end of §16 on printed p.135. |

No node was introduced, so no `addedBy` marker is needed. The new Mumford-regularity API and skyscraper test distinguish coherent sheaves from vector bundles; the classifying-map tests now treat the trivial representation as zero in the connected pointed target, with rank kept in the K₀ component. The native Lean prototypes remain on existing degree-zero and ordinary-category carriers. The regenerated current catalogue explicitly identifies unavailable enhanced, spectral and Chow signatures as omissions, rather than executable declarations.

For Brown–Gersten vanishing, the corrected induction concerns W∖U for a class defined on W, and handles the finitely many ambient codimension-d generic points successively. Each step controls its Mayer–Vietoris boundary on the overlap before adding a neighbourhood. This supplies the missing argument without changing the theorem. For Quillen–Hiller operations, a compatible finite-rank class is no longer equated with a genuine universal map. The already recorded Hiller source gap now explicitly supplies lifting and uniqueness, including control of phantom ambiguity, to the operation and identity nodes.

## Baseline and suppliers

All baseline declarations were read with their enclosing variables and typeclasses at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The [packet](../packets/SchemeKTheoryOperations.json) preserves module/line receipts and records this independent confirmation on each of the 134 entries. Three `provides` descriptions are clarified; no citation is removed:

| Declaration | Exact scope retained |
| --- | --- |
| `Ring.ordFrac` | Nontrivial commutative noetherian R, Krull dimension at most one, and a field with `IsFractionRing R K`; not arbitrary R |
| `ObjectProperty.IsVerdierLeftLocalizing` | The factorization class itself; the fully faithful quotient result also needs a triangulated ambient category, triangulated subcategories and B closed under isomorphism |
| `ObjectProperty.isVerdierLeftLocalizing_iff` | Pretriangulated C, triangulated A and B, and B closed under isomorphisms; every B.trW denominator ending in A refines to an (A ∩ B).trW denominator with source in A |

Ordinary derived categories are carriers, not an enhanced derived category. Tau Ceti’s Cartan equivalence retains its finite-resolution hypothesis. The declaration windows also distinguish finite, finitely presented and coherent sheaf predicates and keep the tilde adjunction’s actual variance. These narrower library interfaces are bridged by the named nodes and requests, not by presumed missing instances.

| Supplier | Distinct prerequisite contracts read |
| --- | --- |
| KTheoryLowDegrees | 73 |
| GeneralAlgebraicKTheory | 29 |
| StableHomotopyKTheory | 14 |
| EnhancedDerivedSheaves | 10 |
| SchemeAndStackFoundations | 4 |
| AlgebraicModuliForArithmeticGeometry | 2 |
| DeformationAndDerivedPatchingAlgebra | 2 |
| AdicCoefficientsAndComparisons | 1 |
| DerivedDeRhamCohomology | 1 |
| RelativeFarguesFontaine | 1 |

The explicit K.4 contracts were checked for Gillet–Waldhausen’s ambient exactness hypotheses, Waldhausen approximation, cylinder/localisation hypotheses and naturality. K.5 supplies the connective cover with its K₀-image convention, rather than a full connective-spectrum fibre sequence. K.7 pairings retain their admissibility conditions. E0/E1 supply the sheaf enhancement and derived functors; H.2/H.5/H.6 supply general homotopy and convergence machinery. Missing source proofs in Hiller, Gillet–Levine, Quillen’s triangular-group theorem and the weighted-module bridges remain named gaps. Stage references were checked against their actual stage descriptions, then against the precise additional requests where the description did not supply a theorem.

## Assigned red-team findings

| Finding | Independently checked disposition |
| --- | --- |
| RT-AREA-ktheory-1/17 | Ring Bass/Nil and categorical negative vanishing remain K.6 imports; scheme negative G is S.2, scheme IK/TT agreement S.5. S.3 uses direct Frobenius localisation. |
| RT-AREA-ktheory-1/23 | H.6 owns generic exact couples, filtered spectra and convergence; S.4 owns the scheme descent/coniveau instance and residues. |
| RT-AREA-ktheory-2/38 | The explicit S.4 Nisnevich fallback is the current owner; a future SF.2 transfer must replace it rather than duplicate it. The square criterion and cohomological-dimension inputs are separate contracts. |
| RT-AREA-ktheory-2/39 | Projective/flag and blowup geometry are imported from R09.1/R09.7a; S.5 owns their K formulas, S.7 the K/Chow compatibility. SF.5 owns geometric intersection/GRR. |
| RT-AREA-ktheory-2/40 | StableReduction layer 2 and JacobianChallenge layer C supply their proper-coherence/proper-flat finite-presentation overlaps. S.2 supplies derived and proper-support bridges. |
| RT-AREA-ktheory-2/41 | S.6 supplies the M.6b operation consumer, with the unused M.4 edge removed in the proposal. Z.3 supplies abstract operations; S.2/S.5 supply Z.5/Z.6’s scheme comparisons. |
| RT-AREA-ktheory-2/42 | S.3 supplies Dedekind localisation to N.2; arithmetic finite-support and field-extension consequences remain N.2. |
| RT-AREA-ktheory-2/45 | Arbitrary-ring perfect modules remain with DGAInfinity layer 5; S.1 supplies the scheme/affine comparison. P7 is the complete-local overlap; enhancements stay with E0/E1. |

The proposals are checked, not promoted. No integrated atlas, campaign document, supplier packet or upstream Tau Ceti roadmap is edited.

## Source findings and receipts

Every inherited source finding was checked at its locator. E4/E5 remain rejected as routine omitted arguments. **E41 is newly rejected**: the zero-ring counterexample violates the K-book’s explicit convention 1≠0, Chapter I opening, book p.1/PDF p.9. The packet retains an explicit nonzero condition for its broader Lean-facing ring convention. E2/E23’s author-correction descriptions are paraphrased; E45’s doubled-plane page is corrected to p.374.

| New finding | Version-scoped diagnosis |
| --- | --- |
| E52 | K-book V.3.10.2, book p.394/PDF p.402: pseudo-coherence does not imply a global vector-bundle resolution on every noetherian scheme |
| E53 | K-book V.9.7, book p.440/PDF p.448: t=0 gives an identity map, so the relative-divisor statement needs a nonzerodivisor condition |
| E54 | K-book V.10.8 proof, book p.447/PDF p.455: the varying-open complement and Mayer–Vietoris gluing need the repaired codimension induction |
| E55 | TT 2.5.6, printed p.305/PDF p.59: E belongs on X, the domain of f, not X′ |
| E56 | K-book V.4.1, book p.400/PDF p.408: reverse the quotient indices for the displayed descending filtration |
| E57 | K-book IV.5.3.1, book p.313/PDF p.321: reduced exterior operations give the normalized λ map, not the raw exterior map |
| E58 | Same locator: restriction of representations reverses the subgroup inclusion |
| E59 | Same locator, equation (5.3.2): the finite-rank/genuine-map identification lacks a phantom-control justification; no particular phantom counterexample is asserted |
| E60 | K-book II.4.5.4, book p.95/PDF p.103: the projective rank bound is ≤dim R, not <dim R |
| E61 | K-book I.5.15.1, book p.58/PDF p.66: a hyperplane’s ideal is O(−1), whereas its divisor bundle is O(1) |
| E62 | K-book II.8.4, book p.148/PDF p.156: finite direct image and its H-category lie on Y |

The complete public three-page [author correction list](https://web.archive.org/web/20240211190150id_/https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.errata.pdf) was reread, along with the named passage contexts. Targeted searches returned no matching primary correction for these new findings. This does not claim that no correction exists elsewhere. All K-book findings concern the author-hosted 29 August 2013 draft; the published AMS edition was not read. No author was contacted and no private source was used.

The 32 fresh public receipts and all node locators are in the packet and [reader](../readmes/SchemeKTheoryOperations.md). The stale primary hashes for the author errata and Soulé article are brought into agreement with the already distinguished fresh-review hashes. TT uses printed=PDF+246; Thomason 1993 uses PDF=printed−193, including its cover. The Borel–Serre GRR proof is followed through §16, printed p.135/PDF p.40. This is an audit of cited passages and necessary proof contexts, not a claim to have read every page of every source volume.

## Validation and disposition

`python3 scripts/check_blueprint.py research/blueprint/packets/SchemeKTheoryOperations.json` reports **0 errors and 0 warnings**, with all seven stages planned. Companion consistency, the per-node/source-issue review coverage, JSON validity, the prerequisite graph and the deliverable path restriction were checked. `git diff --check` is clean.

Memory was sufficient for the prescribed single `lean-check` attempt. It stops at the missing object file for `TauCeti.Algebra.Category.ModuleCat.CartanMap`, before elaborating this suggested file. Therefore full-file elaboration is **not established**. No library build, cache download, Lake update or Lean language server was started. The available build’s Mathlib pin agrees with the required pin; the absent Tau Ceti import is a build availability limitation, not a claimed successful compile.

No question blocks acceptance of the review. Normal follow-up work is precisely the 42 recorded gaps and 42 requests; it is outside this one-job run. The [handoff](../handoff/REV-SchemeKTheoryOperations~3.md) carries the durable completion and compilation receipts. The orchestrator may take the current accepted plan through its normal intake; this review itself promotes nothing.
