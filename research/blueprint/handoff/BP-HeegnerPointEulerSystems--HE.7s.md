# BP-HeegnerPointEulerSystems--HE.7s handoff

Codex, session `codex-Xi8tHh`, claimed issue #752 after the swarm bot confirmed the claim. This is a completed target-level planning pass, ready for independent review, rather than a checkpoint. It changes only the four issue deliverables. Every mathematical declaration remains implementation-unchecked.

## Completed scope

The packet contains 59 nodes: 2 definitions, 7 constructions, 5 promoted API lemmas, 44 theorems and 1 comparison. Its nine definitions/constructions have 36 API items and 27 discriminating examples. Five API signatures are shared with promoted lemma nodes, giving 90 distinct named declarations in the suggested file. There are eleven planets: six in HE.8 and five in HE.8b. Nine baseline declarations were checked by reading their statements at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`; the Tau Ceti baseline is `f790474821cf4256814db967cb154e7af3d0c369`.

HE.8 and HE.8b are `planned`. HE.7s and HE.8c are `source_decomposed` process boundaries, with imports and removal proposals, rather than mathematical nodes. No stage is closed. The packet has status `complete` under PROTOCOL section 0: every target in scope has a declaration, import, exact requested interface or explicit gap.

The existing Howard Theorem B and Cornut–Vatsal node identities are preserved. The CV theorem retains its HE.8c identifier but has mathematical parent HE.8; its definite branch is separate. The reviewed HE.0–HE.7 declarations supply classical arithmetic, CM and dyadic descent. This pass does not reproduce those plans or claim they have been formalised.

The family construction explicitly records CGLS’s weaker E(K)[p]=0 branch and class-number conductor shifts. Howard’s stronger full-image and class-number hypotheses remain on his divisibility theorem. Rational irreducible, integral surjective and Eisenstein main-conjecture branches are distinguished. BCGS A/B and Castella–Sano C retain their main-conjecture hypotheses in HE.8; split-prime corollaries discharge them in HE.8b. No inert main conjecture or every-character nonvanishing is claimed.

## Confirmed red-team findings

- **RT-AREA-iwasawa-1/1:** joint CM distribution and orbit surjectivity have named HE.8 nodes. GN.4 is requested to supply the precise S-arithmetic uniform-distribution and twisted-diagonal/commensurability results. Its current real Lie-group nodes are near misses. The general finite-extension-of-ℚ_p input remains a verification gap. The arithmetic reciprocity and component-fibre applications stay here.
- **RT-AREA-iwasawa-1/5:** propose the new elliptic-unit owner, with Rubin’s two-variable theorem, Hida–Tilouine’s anticyclotomic form and Hida’s Katz μ theorem; request Kato L4’s integral Wüthrich distinguished-lattice/divisibility extension. Both feed independent BSD.7a, and the Rubin/Iwasawa source alternative recorded at HE.7s. The reviewed direct Nekovář CM descent is retained without adding an unsupported elliptic-unit prerequisite.
- **RT-AREA-iwasawa-1/13:** propose re-extracting HE.8 from README lines 102–108 and HE.8b from 110–116, with their process notes separate, and correcting BSD.6/6a and BSD.7/7a similarly. Move the CV theorem’s parent to HE.8 and remove the reversed process edges. Keep early HE.8 → BSD.7a → HE.8b distinct from late equality applications. Atlas records were not edited.

An additional rescope proposal corrects AutomorphicCongruences L5a’s BCS v2 two-variable locator to Theorem 4.1.3/Corollary 4.1.4. Theorem 4.2.1 is the anticyclotomic Euler-system bound, not that shared comparison. Completed cyclotomic L5b is never an input to the anticyclotomic proof.

## Open contracts and where to resume

The packet enumerates 27 exact requests and eight gaps. Start with those contracts and their `neededBy` lists; do not add duplicate definitions in this packet.

1. **Geometry and source acquisition:** certify GN.4’s non-Archimedean product theorem, especially the general F_P twisted-diagonal input; acquire Rubin 1987 and the new elliptic-unit proofs with all prime/coefficient hypotheses. Obtain a publisher-text collation for the BCGS findings.
2. **Arithmetic family:** close the reviewed HE.0 part’s global χ change-of-group/localization square. Preserve its inherited gap through the Λ-adic correction. ES.3/ES.4/ES.8 own generic derivative, rigidity, stub, exact-length and error-controlled specialization machinery; HE supplies actual arithmetic classes and verifies its hypotheses.
3. **Integral reciprocity and control:** GZ.9/PadicHodgeRegulators L3 must supply the CH family logarithm on the distinguished lattice. SelmerIwasawaCohomology must certify the exact JSW finite-cokernel/Tamagawa factors and the separate strict ordinary derived determinant base change. In particular, the BCGS comparison of full local Tate invariants with the ordinary unit-root factor is a specific verification obligation. Full Tate invariants, ordinary-quotient invariants and reduction torsion have not been equated merely by notation; this is not recorded as a proven source error.
4. **Return equalities:** certify the exact Wan/Fujiwara auxiliary-field, residual-restriction, period, μ and coefficient contracts from L5a/L5w and L3h. BSD.7a must supply the precise CGS Eisenstein theorem with its local-character exclusions and the missing elliptic-unit/integral-Kato dependencies. Its consumers may use only early HE.8 declarations.
5. **Production signatures:** replace the explicitly omitted arithmetic hypotheses and supplied algebraic maps/modules/ideals in the Lean prototype by the actual named supplier objects. Elaboration checks shapes, not these identifications or the truth of admitted theorems.

Other requests specify the exact quaternionic geometry, P-new vectors, torsion finiteness, root-number, Waldspurger/Gross–Zagier, Néron component, duality and Weierstrass separation statements. Existing finer SIC/GZ declarations are imported where their statements match; extension requests identify where those declarations fall short. Upstream Chebotarev is imported and is not re-planned.

## Sources and version limits

All acquired PDFs have URLs, access dates, SHA-256 hashes and read-section records in the packet. No downloaded text is a repository deliverable.

Read Howard’s introduction and §§2.1–2.3; Cornut’s modular trace theorem and introduction; Cornut–Vatsal’s hypothesis/sign/character statements, §4.1, §§4.3–4.6 and §§5.3–5.4; and the companion distribution paper’s Theorem 2.9, Corollary 2.10, local reduction and complete §2.7 argument, with the §2.1–§2.2 conditions checked again for the precise joint-distribution statement. Read BCGS arXiv v2’s introduction and §§1–2, BCS arXiv v2’s anticyclotomic argument §§1–5, CGLS §§4.1–4.2, Castella–Sano’s introduction and all §3, and Wüthrich’s introduction Theorems 1–3 and Theorem 4 statement. Wüthrich’s integral Kato proof is an owner request, not a claimed proof read here. Cyclotomic endpoints are outside this scope.

BCGS’s linked author copy dated 2 January 2026 was compared for the discriminant slip and specialization condition. The publisher DOI request returned HTTP 403; no version-of-record collation is claimed. Castella–Sano is scoped to the 20 January 2026 manuscript/arXiv v1. The two findings are limited misprints: positive versus signed discriminant in BCGS, and the reversed coefficient-ideal membership in CS Lemma 3.1.1. Each has an explicit check and correction-search record. No theorem is accused of failure. Rubin 1987, the new imaginary-quadratic IMC proof sources and the exact general-F_P dynamics reference remain unacquired/unverified.

The two upstream model documents read in full were GlobalNumberFields and Chebotarev. RS-04, the reviewed library audit, the existing HE.0 packet/decomposition, the supplier stages and finer SIC/GZ nodes, and all fourteen touching link/overlap entries were checked for boundaries and conventions.

## Validation

- Required `python3 scripts/check_blueprint.py research/blueprint/packets/HeegnerPointEulerSystems--HE.7s.json`: zero errors and zero warnings.
- An additional checker run against a cited-only index of the nine declarations read at the exact Mathlib pin: zero errors and zero warnings. That index is a positive-citation check, not a complete library census.
- Source-issue and source-version schema checks: passed. Literal excerpts were matched against the acquired source text, with PDF whitespace normalized.
- Recursive reachable fine-declaration graph: 221 nodes traversed, no cycle. Requested stages and baseline references are boundary leaves. The known coarse atlas extraction defects are proposals; no global coarse-stage acyclicity claim is made.
- Packet/Lean name audit: every node, API item and named example appears, five promoted API signatures occur once, and there are 90 distinct named declarations plus 27 examples.
- `lean-check` of the final suggested file: passed with only declaration-admission warnings. The shared build’s Mathlib commit matches the pin exactly; the file imports no Tau Ceti modules. This is elaboration of admitted signatures, not formalisation. Memory was checked before each run, and no build, cache update or language server was started.

The pull request must say `Refs #752`, identify Codex and these checks, and use the session-prefixed branch. Independent review decides acceptance; workers do not apply the restructuring, merge, close the issue or change labels.
