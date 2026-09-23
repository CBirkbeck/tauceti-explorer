# PAPER-SCHMIDT-STIX-16: Anabelian geometry with étale homotopy types

Alexander Schmidt and Jakob Stix, [Annals of Mathematics 184 (2016), 817–868](https://doi.org/10.4007/annals.2016.184.3.5); [arXiv 1504.01068v2](https://arxiv.org/abs/1504.01068v2).

Original extraction: Claude Code — cc-39fac3, 2026-09-22, issue #1167 / PR #1976.
Independent review and corrections: Codex — codex-a71f92, 2026-09-23, issue #1169.

Status: **partial; independent verdict revise**. This supersedes the original complete claim. The extraction contains 93 items: 2 library, 9 planned and 82 missing; 11 routes; 18 prerequisite entries; eight explicit gaps; and 15 independently reviewed source-issue records (13 confirmed, 2 rejected). Every missing item occurs in one route, but four routes remain rejected candidates. A complete review is not an accepted extraction.

## Results and scope

The paper reformulates curve reconstruction using the relative étale homotopy category. Theorem 1.1 is an Isom theorem for smooth hyperbolic curves over sub-p-adic fields; Theorem 3.2 is the separate dominant Hom theorem.

For smooth geometrically connected varieties over a field finitely generated over Q, embeddable in products of hyperbolic curves, Theorems 1.2/4.7 give the unique functorial retraction on Isom. Mochizuki gives the map to the ambient product; finite-field point counts and Tamagawa's rational-point separation establish factorization through the target. Kernel elements act class-preservingly by geometric fundamental-group elements (Theorem 1.9).

Strongly hyperbolic Artin neighbourhoods are towers of elementary fibrations with product embeddings. The retraction is bijective for them (Theorem 1.5), as is the corresponding outer Galois-equivariant fundamental-group reconstruction (Corollary 1.6). Lemma 6.3 gives such open neighbourhoods over infinite perfect fields; the anabelian conclusion requires the stronger finitely-generated-over-Q hypothesis.

Theorems 7.1 and 7.2 respectively provide absolute and non-geometrically-connected forms. Their extra ingredients include Pop's field reconstruction, the Galois-group normal-subgroup theorem, constant fields and all-n Kummer theory. They cannot be imported merely from a proper-curve reconstruction plan.

The appendix supplies covering theory, homotopy limits, pointed/unpointed comparison and pro-classifying spaces. Its model structure is Isaksen's homotopy-pro-group model, **not** the strict model. The weak-equivalence test uses all local systems in the general case.

## Existing owners and partial library support

All cited library declarations were opened at Mathlib 082e2d3 and Tau Ceti f790474. Mathlib provides simplicial carriers, horns, the Kan predicate, nerves and an abstract model-category class, not the full ordinary Kan–Quillen instance. It also supplies absolute Galois groups, Krull topology, profinite groups and compactness inputs.

The existing Ind construction is relevant to pro-categories; DiamondsAndVStacks:D0 already owns the generic pro-category carrier. StableHomotopyKTheory:H.1 owns ordinary BG/EG inputs. Upstream AlgebraicTopology Stage 8 owns Kan homotopy groups and realization comparison. These must not be replanned inside a new pro-space roadmap.

Tau Ceti already constructs the Kummer map and its injection on power classes. The full isomorphism remains planned by ProfiniteCohomology Layer 9. AlgebraicCurves Layer 7 supplies Hurwitz. SF.2 and EDC.2 supply cohomology and duality plans, subject to precise coefficient and morphism hypotheses. The original claims that IG.3 plans arbitrary-characteristic ℓ-covers and that R09.7 supplies general smooth-variety compactification were too broad.

Reviewed audits and exact layer evidence are recorded in the [review](../reviews/REV-PAPER-SCHMIDT-STIX-16.md).

## Route decisions

| Route | Review | Owner/candidate |
| --- | --- | --- |
| 1 | accept | AnabelianGeometryAndNonabelianChabauty — AnabelianGeometryAndNonabelianChabauty:NC.1 |
| 2 | accept | InverseGaloisAndArithmeticFundamentalGroups — InverseGaloisAndArithmeticFundamentalGroups:IG.1 |
| 3 | reject | InverseGaloisAndArithmeticFundamentalGroups — InverseGaloisAndArithmeticFundamentalGroups:IG.2 |
| 4 | reject | AnalyticNumberTheory — AnalyticNumberTheory:AN.4 |
| 5 | accept | AlgebraicModuliForArithmeticGeometry — AlgebraicModuliForArithmeticGeometry:R09.2 |
| 6 | accept | SchemeAndStackFoundations — SchemeAndStackFoundations:SF.0 |
| 7 | reject | EtaleHomotopyTypes |
| 8 | reject | AnabelianGeometryAndNonabelianChabautyPartIIEtaleHomotopyTypes |
| 9 | accept | DiamondsAndVStacks — DiamondsAndVStacks:D0 |
| 10 | accept | StableHomotopyKTheory — StableHomotopyKTheory:H.1 |
| 11 | accept | SchemeAndStackFoundations — SchemeAndStackFoundations:SF.2 |

The accepted source decisions are narrowed ownership judgments. In particular R09.2 must supply a marked-boundary adapter, not call the affine theorem a verbatim statement of DM69. AN.4's number-field analytic interface does not supply arithmetic-scheme Chebotarev.

The two new/Part II briefs remain explicitly unaccepted. Generic pro-categories, ordinary BG/EG and cohomology have been removed from their proposed construction scope. General compactification and Pop reconstruction are visible in the rejected Part II only as quarantined unresolved imports. They are not assigned to that roadmap.

The overall revise verdict means the current queue does not apply any route from this extraction.

## Source issues

The published 52-page article was independently read in full. Selected arXiv v2 TeX and author-PDF passages were compared, and published pp. 848, 857 and 858 were inspected visually.

E1–E5 are confirmed slips: the functoriality clause reference, explicit smoothness qualifier, composition order, removal of zero in the dense exponent set, and target base point. E2 is a clarification within the already smooth ambient family, not a disproof of the intended theorem.

E6 is rejected as a proof gap: the base-changed triangle and the defining immersion construction of r already give r(γ′)=id. Uniqueness of γ′ is unnecessary.

E7 is rejected: the published calligraphic universal family and its fibre have different names; text extraction erased that distinction. The alleged circular definition is correct as printed. A separate later subscript slip is E14.

Newly recorded confirmed findings:

- E8, p. 850: the base-field scheme arrow has its direction reversed.
- E9, p. 857: the displayed product describes a cosimplicial degree, not partial totalization. An identity diagram of two discrete two-point spaces gives cardinalities eight versus two.
- E10, p. 858: the relative cylinder projection need not be a fibration. A two-dimensional outer horn in Δ[1] provides a counterexample. The weak-equivalence cylinder is sufficient; this does not disprove A.9/A.10.
- E11, p. 858: endpoint indices and the source-point label.
- E12, p. 853: the pointed subcategory's ambient category.
- E13, p. 861: relative Hom qualifications in equations (9)–(10).
- E14, p. 848: the later universal-family subscript, distinct from rejected E7.
- E15, p. 825: the reference to A.13(b), which defines the stabilizer preimage.

No matching published correction was found in the journal, arXiv history, either author's publication pages or Crossref relations as checked on 2026-09-23. This is a bounded search, not a guarantee that no correction exists. See the JSON records and review for URLs and arguments.

## Remaining work and checks

G1–G8 in the result JSON describe atomic coverage, Hilbertian/Pop inputs, pro-homotopy source closure, arithmetic-scheme Chebotarev, general compactification, the marked-curve adapter, ordinary homotopy ownership and exact cohomology ranges.

The in-place repairs do not close those gaps. The next extraction pass should resolve suppliers and prerequisite statements before accepting either new roadmap, then split the remaining multipart records.

The paper validator and targeted repository tests are run for this review, together with finite linear-algebra, point-count, horn and totalization regression checks described in the review. These are mathematical diagnostics, not formal proofs. No Lean file was written or compiled.
