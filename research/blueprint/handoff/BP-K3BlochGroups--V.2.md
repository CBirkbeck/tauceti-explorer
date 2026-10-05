# BP-K3BlochGroups--V.2 handoff

Completed by Codex, session `codex-RbnUTd`, for issue #6382. This is a completed target-level planning pass, ready for independent review. Packet status is `complete`; the only scoped stage, `K3BlochGroups:V.2`, is `planned`, not closed. Nothing is claimed implemented.

## Deliverables and counts

The packet, reader and suggested file use the issue's `K3BlochGroups--V.2` paths. The packet adds 8 nodes: 5 constructions, 1 lemma and 2 theorems; 26 API items; 15 unit tests; 3 new planets; 9 cited baseline declarations; 4 gaps; 10 supplier requests. It imports all 10 V.2 nodes of the accepted parent without reusing their IDs. Together with the parent's 3 planets, the assembled layer has exactly 6 planets.

The original stage targets are all planned: degree-three product/image/cokernel and exactness; real-place Milnor contribution and totally imaginary vanishing; arithmetic rank and rationalisation. New consumer interfaces give the canonical real-place basis, sign-isolating symbol representatives, surjectivity of the product with −1, the actual decomposable signature, the totally imaginary quotient equivalence, the stable Hurewicz quotient, the weight-two obstruction proof and the motivic edge quotient.

## Ownership decisions for assembly

- Import `K2SymbolsBrauer:T.2/graded-map` and `/graded-map-degree-three`. The inherited V.2 product-map node is a consumer alias, not a duplicate construction.
- Import `K2SymbolsBrauer:T.2:symbols/milnor-number-field`, whose general n≥3 theorem is already in `K2SymbolsBrauer--T.1.json`. This ownership changed after the follow-up issue text was generated. V.2 owns only its consumer basis/product/image interfaces. Do not create another Bass–Tate theorem in V.2.
- The indecomposable quotient, integral injectivity, right exactness, low-degree motivic sequence and arithmetic/rational nodes retain their accepted parent IDs. The new obstruction theorem does not depend on the inherited injectivity theorem, so it can refine that proof without circularity.
- Keep the Borel rank theorem at R.3; N.3 supplies arithmetic finite generation/rank and N.5 supplies the field/S-integer comparison. No V.5 or N.8 numerical calculation is an incoming prerequisite.
- Do not import M.8 for motivic Chern classes: it has a downstream V.4 dependency. Foundational integral Chern operations need a Motivic–Étale K-theory Part II with M.4/M.6 and the S.7 higher-Chern direction.

## Precise supplier work remaining

1. **G-Chern:** construct integral motivic higher Chern classes, with the projective-bundle, simplicial classifying-space, localization/Whitney and product-rule foundations. Supply V.11.13 with multiplier `(−1)^(i−1)(i−1)!`; in degree three it is +2. Rational Chern characters do not suffice.
2. **G-Izhboldin:** give the general no-characteristic-prime-torsion theorem at the Milnor owner, including the Bloch–Kato–Gabber differential-symbol, torsion divisibility, Artin–Schreier transfer and induction inputs. This supplies V.2's characteristic-two branch; M.5d is not presumed to already state it.
3. **G-comparison:** give fine supplier nodes for the natural degree-zero weight-two motivic-to-étale comparison, not just diagonal norm residue, and for algebraically closed K₄ divisibility with both characteristic regimes. M.4 supplies coefficient triangles; M.5 needs the truncated comparison extension; M.7 supplies rigidity/finite-coefficient comparison. Restriction on the constant étale Z/2 must be identified, since the descent argument uses its injectivity.
4. **G-supplier-proofs:** resolve the existing Bass–Tate and algebraically closed Milnor proof gaps at their owner nodes. The original Bass–Tate paper is now available and its Chapter II §2 proof was read. General finiteness and the Moore/Tate/Weil arithmetic proofs remain supplier inputs. Retain the degree n≥2 restriction for algebraically closed Milnor unique divisibility.

Ten precise requests are recorded in the packet, including requests against existing supplier theorem nodes for proof closure and N.3/N.5 arithmetic requests. No messages were sent to other workers or supplier issues. Existing upstream homotopy and product inputs stay with the parent; this continuation does not claim to close those parent gaps.

## Sources inspected and missing

Public scans were fetched only into disposable scratch space. Persistent URLs, SHA-256 checksums, access date and read sections are in the packet and reader.

- Bass–Tate, *The Milnor ring of a global field*, LNM 342, Chapter II §§1–2, printed pp.393–402, especially Theorem (2.1)(3) and its complete proof. The scan is the entire LNM volume; do not confuse printed paper pages with PDF page indices. Chapters/sections outside the ledger were not inspected. The generator identity comes from the end of the proof on pp.401–402.
- Weibel, separately hosted K-book chapter III: III.7.1–7.3 and III.7.7–7.8, including the Izhboldin proof.
- Chapter V: V.11.3, V.11.11 and V.11.13 with their proofs.
- Chapter VI: VI.1.1–1.6, VI.4.1–4.3.2, opening of VI.5 and Lemma 5.3. The integral argument was distinguished from the finite-coefficient counterexample.

The cited Bloch/MVW foundations, Bloch–Kato/Izhboldin original papers, and Moore/Tate/Weil references were not independently read. This limitation is in the gaps. No newly identified source mistake was recorded; the already reviewed parent issue `K3BlochGroups/E6` supplies the correction to the characteristic scope of the K₄-divisibility citation. No comparison with the published K-book printing was made.

Read upstream AlgebraicTopology and UniversalCovers roadmap documents, the reviewed library audit, the accepted parent plan/review, supplier node statements, and relevant current consumer documents. The issue's older assertion that V.2 owns general Bass–Tate is superseded by the inspected supplier packet.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/K3BlochGroups--V.2.json`: **0 errors, 0 warnings**, using the provided pinned declaration index.
- `lean-check research/blueprint/suggested/K3BlochGroups--V.2.lean`: **exit 0**, with only the expected placeholder-proof warnings. Memory was checked first. No language server, Lake build/update/cache operation or extra build project was started.
- The suggested file's 26 API names and all 15 named test examples match the packet. Its five constructions are mathematically valid generic additive-carrier forms with explicit supplier hypotheses. The missing motivic obstruction objects are identified in an exact statement comment, rather than represented by a fabricated predicate or assumed structure field. The ten inherited forms remain in the parent's suggested file.
- Source statements were read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. The source-only index omits declarations generated by additive translation. The packet cites the indexed generating source declarations and records the exact generated additive names; their signatures were also checked by elaboration.
- Checked prerequisite traversal through all available blueprint/decomposition nodes and atlas stage requirements: 121 reachable entries, **no cycle**. Supplier request descriptions are proof-refinement contracts, not reverse dependencies on consumers.
- Checked the four deliverable paths with the intake checker, JSON validity, forbidden local paths and mathematical-document restrictions, and whitespace with the diff checker. Only the four authorized deliverables are submitted.

The follow-up should refine supplier proofs and return exact node IDs to the existing contracts, then let assembly join this continuation to the accepted parent. It must preserve integral coefficient distinctions, the quotient's actual image subgroup and the six-planet bound. No scratch file is required to resume.
