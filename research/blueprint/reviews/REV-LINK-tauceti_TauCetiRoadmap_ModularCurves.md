# Independent review: Modular Curves links

**Accepted after corrections.** Reviewer: `independent-review-REV-LINK-tauceti_TauCetiRoadmap_ModularCurves`; Codex, session `codex-hjdg0j`, 2026-09-23. Original author: Claude Opus 5 (1M context), unattended link job. This is independent work.

The revised packet has **43 links, 20 overlaps and 217 active-roadmap entries**. It removes four duplicate pairs, replaces two pending roadmap dependencies with existing library imports, retargets the Legendre construction and adds three missed directed contracts. Recommendations concern interface coordination; no upstream roadmap has been rewritten or certified implemented.

## Read scope and method

Read the complete 2,550-line focal README, all 58 focal stage descriptions, every external endpoint of the 46 original links and 19 overlaps in full, the original handoff, all 58 reviewed library-coverage entries and REV-AUDIT-12. Read the new LV.6, RG2.0a, RS.0 and T0 endpoints fully, together with the relevant Igusa and analytic Habiro candidates. Read the specified pinned declarations below. Base snapshot: `5d009add6178a4852be5cbe7ca5987e07f80a1f3`.

Refreshed the catalogue-wide keyword screen across the 2,007 stage descriptions, retaining the original screen's scope rather than claiming full reads of unrelated roadmaps. Read the summaries of the five newly added designs. Removed the retired FoundationsAndLibraryIntegration entry; active coverage is the union of atlas and current roadmap definitions, minus retirements. Eight completeness checks, with search terms and decisions, are recorded in `completenessSpotChecks`.

## Every original link

The identifiers below are positions in the original 46-link packet, before deletion. Each retained pair has relevant supplier/consumer evidence and prerequisite-to-consumer direction.

| Original links | Decision and mathematical boundary |
|---|---|
| 1–7 | Retain JC A/B/C inputs: divisors and invertible sheaves, fibre Riemann–Roch, relative cohomology/base change and fibrewise Euler characteristic. These do not import JC D representability into relative genus one. |
| 8 | Remove as pending EC supplier: the equation-level nonzero multiplication isogeny and degree formula already exist at the pin. Preserve evidence and record the library import. Relative finite local freeness and scheme/function-field comparison remain MC work. |
| 9 | Retain equation-level Weil-pairing comparison at invertible level. Scheme perfection and alternation remain separate MC milestones; neither pairing is established merely by existing linear algebra. |
| 10 | Remove the future Aut-carrier dependency: the stabilizer carrier and generic-j classification already exist. Exceptional characteristic-2/3 classification, actions and normalizers remain MC 10 work. |
| 11–14 | Deduplicate AC 7/8/9/12 → MC 10; the same pairs are in the AlgebraicCurves packet. Retain their source contracts: different/Hurwitz, lower ramification, differential comparison and componentwise curve/function-field dictionary. |
| 15–20 | Retain fine/full/coarse curves, pairing and twisted-curve inputs to Part II R12.1/R12.2/R12.4. Fixed determinant means a pairing fibre, not an already-proved connected component. R12.4 discharges MC 5C's external connectedness hypotheses; no cyclic reverse edge added. |
| 21–23 | Retain compactification and affine coarse inputs only on the common prime-level diamond-quotient scope. General full/composite levels remain Part II. Normalization comparison requires finite normal models and schematically dense opens, not just a universal-property slogan. |
| 24–25 | Retain integral elementary-level and cyclicity-locus inputs to R13.2; arbitrary integral Drinfeld level is not assumed rigid. |
| 26 | Clarify restriction to the open part of the **base** with smooth proper fibres. The smooth locus of a nodal generalized elliptic fibre is not a proper elliptic curve. |
| 27 | Retain diamond-action conventions into R14.1: distinguish row-basis action and the inverse convention inside SL₂. |
| 28–32 | Retain actual elliptic objects, Weierstrass presentation, relative Picard/Poincare and pairing comparisons in abelian-scheme A1/A2/A5. Higher-dimensional construction remains there; genus-one comparison does not license a second elliptic carrier. |
| 33 | Retain the finite affine equivalence-relation quotient as the existing special case of R09.3; it does not represent every quotient algebraic space. |
| 34–36 | Retain scheme isogenies, the field-points dictionary for elliptic modularity and E[p] for local torsion analysis. Arbitrary-isogeny function-field comparison belongs to AC 12; composite X₀ compactification belongs to Part II. |
| 37–42 | Retain PEL, perfectoid-tower and Shimura comparison inputs, with level bounds, determinant fibres, row/adelic conventions and fine/coarse qualifications. MC 10 supplies only prime N ≥ 5 diamond quotients. |
| 43 | Retain CM cyclic-isogeny pairs as noncuspidal coarse Y₀ points; compactification, descent to class fields and Heegner classes require the other HE.1 inputs. |
| 44 | Retain only the full-level affine model used in constructing algebraic Siegel units. Kato's mixed and Γ₁ levels still require their level adapters and Part II analytic/algebraic comparison. |
| 45 | Retain the universal Legendre curve as the geometric input to LV.2's good-model example; connections and comparison structures are not supplied by MC. |
| 46 | Remove stale LV.5 endpoint/quotation and replace by LV.6, where the Legendre elliptic family now appears. LV.5 supplies surface topology. |

Thirty-four original quotations needed literal whitespace restoration, including newlines. All current evidence is now a true substring of the stage or its authoritative README. Thirty-six retained `explicit` labels were lowered conservatively to `inferred`: the exact output/use matches stand, but reciprocal naming is not established in both texts. One-sided named citations remain visible in the reasons.

## Every overlap

All original overlaps are supported, with the following refinements. The packet now includes evidence for every endpoint.

| Original overlap | Decision |
|---|---|
| 1, JC Picard | Preserve both upstream scopes and the relative genus-one route; do not move MC's theorem into JC D. Compare the field specialization, sign and Poincare rigidifications. |
| 2, ordinary/Frobenius | Keep equation/scheme distinction and prove the field comparison, including inseparable maps and the geometric supersingularity predicate. |
| 3, formal groups | Import the already-built coordinate formal group and base change. MC keeps intrinsic completion and comparison. Multiplication-series compatibility is still an obligation. |
| 4, Tate curve | Share integral coefficient identities. The Z[[q]] equation has singular q=0 fibre; ellipticity follows after inverting q, and j is Laurent. Point-level analytic uniformization does not supply formal scheme cusps. |
| 5, field dictionary | Preserve MC's narrow bridge; compare with AC's later general dictionary without adding a reverse prerequisite. |
| 6, formal cusps | Part II extends and compares the prime diamond package; no duplicate widths/stabilizers on that common scope. |
| 7, abelian isogenies | Keep genus-one comparisons for quotients, nonzero multiplication ranks and polarization-normalized Weil pairings. |
| 8, Serre–Tate | Correct the proposed reversal: A4 generalizes and compares with upstream MC 7F. MC does not wait for a newly split A4. |
| 9, Grassmann/Weil | Import MC's common-scope Grassmannian and affine Weil restriction; general parameter spaces/algebraic spaces remain extensions. R09.3's Weil-restriction assignment is in its README's handoff paragraph. |
| 10, descent | Keep polarized effective descent in the existing suppliers and compare their common scope. SF.1 is an umbrella contract, not evidence of a fourth detailed theorem. Do not transfer ownership or enlarge MC by decree. |
| 11, coarse spaces | General stack coarse spaces compare with MC's existing affine elliptic problems and exact base-change alternatives. |
| 12, deformations | Keep rigidified elliptic local-ring comparison; R09.6 generalizes to its scheme/stack setting with stabilizers. |
| 13, Cartier duality | Import existing affine-base duality first. MC keeps arbitrary-base/evaluation/rank/exactness extensions. Kernels need not be locally free, and quotient representability is conditional. |
| 14, p-divisible groups | Preserve KM's limited route. Splitting is on the perfect special fibre, not automatically over the henselian base. Dieudonne generalization compares with it. |
| 15, reductive groups | Correct library attribution and avoid assigning already-built affine foundations as new work. General noncommutative groups and positive-dimensional quotients are not replaced by MC finite commutative cases. |
| 16, elliptic K-theory | E.1 imports the actual model and its properties; adapters and regularity consequences do not justify constructing another model. General isogeny comparison uses AC 12. |
| 17, Galois categories | Keep the finite-etale-over-a-field instance and its group/pairing transport; compare with IG's general geometric fibre functor. |
| 18, coefficient categories | Preserve MC's W(k) category; DDPA generalizes and compares. A finite-residue-field-only category would not fit algebraically closed k. |
| 19, cusp counts | Share matching combinatorics while retaining analytic/algebraic carriers and the Part II comparison. |

Added overlap 20 and edge MC 0F → RG2.0a: import affine finitely presented Weil restriction, then extend to the broader finite-type/group-theoretic scope. Also added MC 0F → RS.0 for the finite-etale affine transmutation example and MC 0B → T0 for finite-level Cartier duality/evaluation in the Hodge–Tate map. These three edges and the LV.6 replacement carry `addedBy`.

## Pinned library checks

Read declaration statements at Mathlib `082e2d3` and Tau Ceti `f790474`:

- `AlgebraicGeometry.hopfSpec`, its `fullyFaithful`, and `essImage_hopfSpec` in Mathlib `AlgebraicGeometry/Group/Affine.lean`; Tau Ceti `commHopfAlgCatOpEquivAffineGroupSchemeCat` in `AffineGroupScheme/Equivalence.lean`. The assembled equivalence is over Spec of a commutative ring.
- `finiteLocallyFreeCommAffineGroupSchemeProperty`, `FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDuality`, `cartierDualDualNatIso` and `cartierDualBaseChangeNatIso` in Tau Ceti `AffineGroupScheme/CartierDuality/{FiniteLocallyFree,BaseChange}.lean`. The property includes finite, flat and locally finitely presented; the base remains affine.
- `TauCeti.Isogeny.degree_mulByIntIsogenyOfNeZero` in `EllipticCurve/Isogeny/MulByInt/Degree.lean`: every nonzero integer, not just the separable case.
- `WeierstrassCurve.autGroup` and `autGroupMulEquiv` in `EllipticCurve/Aut.lean`: the latter requires ellipticity and j distinct from 0 and 1728.
- `WeierstrassCurve.formalGroup`, `isComm_formalGroup` and `map_formalGroup` in `EllipticCurve/FormalGroup/Basic.lean`: coordinate formal group over a commutative ring, not intrinsic scheme completion.

AUDIT-12's broader partial/absent boundaries remain visible. No inferred library result is presented as a completed modular-curve theorem. Original provenance is historical and preserved; `reviewProvenance` records this review's source verification.

## Validation and limits

- Canonical link checker: **0 errors, 0 warnings**.
- Strict current evidence: **156 literal quotations**, plus **12 preserved literal quotations** from deduplicated/library-reuse records.
- Four partner pairs verified in the AlgebraicCurves packet. Three partner quotations are literal; five match only after whitespace normalization. Those outside-scope quotations were not edited or counted as literal. Our preserved evidence for those pairs is literal.
- No duplicate proposed directed pairs, retired endpoints or unknown stages; all 217 active roadmaps covered.
- Full directed union, including **3,746 declared prerequisite edges**, is acyclic before and after the change. At the base snapshot: 4,406 → 4,449 edges. Refreshing the three changed external link packets against main `0b1d56c7e8161ccd8c5012266495e6e9f640d615` gives **4,402 → 4,445**, also acyclic. No focal/endpoint text changed in that refresh.
- Intake, three-file scope and whitespace checks are recorded in the handoff. No Lean file changed or compiled; no git command was run.

The review accepts a link map and coordination proposals. It does not certify the source roadmaps, implement their proposed restructurings, or independently re-audit the partner packet. The stale upstream sentence assigning no owner to MC 5C's connectedness contracts remains a documentation follow-up: Part II R12.4 and ComplexComparison C4 now cover those interfaces, without reversing MC's conditional theorem dependency.
