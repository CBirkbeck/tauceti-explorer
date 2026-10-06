# BP-PotentialModularityAndCompatibleSystems--R23.1

Codex, session `codex-o6iGoa`, 6 October 2026. Refs #976. The bot confirmed the claim in [its reply](https://github.com/CBirkbeck/tauceti-explorer/issues/976#issuecomment-6023184837). This is a **complete target-level planning pass**, continuing the inherited packet. It is ready for independent review, rather than another checkpoint.

## Coverage and deliverables

All eight scoped stages—R23.1, R23.2, R23.3, R23.4, R23.5, R23.6, R24.1 and R24.2—have coverage `planned`. **None is closed or source-decomposed.** The pass ends at the exact supplier requests and source gaps it records; mathematical implementation and source closure are not claimed. All implementation statuses are `unchecked`.

The packet contains 49 nodes: 1 definition, 3 constructions, 14 lemmas, 26 theorems and 5 applications; 22 API items; 16 unit tests; 17 planets; 9 pinned baseline declarations; 30 supplier requests; 15 explicit gaps; and 7 source issues (E2–E8). The reader gives the same statements, conventions, proof routes, dependencies, API, tests and acceptance criteria. The suggested file supplies the API/test names and named theorem shapes with explicit omissions.

Thirty-one correct inherited node ids are preserved. Four inherited nodes were removed: the Taylor 2002 local-HBAV-at-l and local-points-at-p/infinity nodes, the Taylor 2006 twisted-moduli/descent/CM-point node, and the R23.6 application-table/noncircularity node. The first three duplicate H6's geometry/local constructions, which are imported; the last is process bookkeeping. Their surviving mathematical uses have imports or requests. Eighteen nodes were added. R23.6 is realized by the residual and given-lift mathematical exports; the packet proposes folding that process panel into the introduction at assembly.

Important corrected definitions and arguments:

- Splitting for an integral Skolem point is `K′ ⊗_K L_v` a product of copies of `L_v`, rather than every completion of `K′` equaling `L_v`. The trivial extension detects the difference.
- The extra place omitted in the deduction of Theorem G **divides** the inverted denominator. A place outside the inverted primes remains a closed point and does not establish incompleteness.
- The rigidified Picard object carries an actual invertible sheaf and boundary trivialization, with boundary-compatible isomorphisms. Forgetting targets Tau Ceti's existing line-bundle class. Its affine-fibration theorem retains the degree bound and boundary contribution.
- Disjointness obtained using split Frobenius places requires a Galois output and local points at the added large places. Avoiding a point field and avoiding its normal closure are distinct assertions.
- Finiteness concerns the unframed global ring. Its positive-dimensional hypothesis is essential for characteristic-zero extraction: a finite nonzero algebra alone can be torsion.

## The eight confirmed findings

1. **RT-AREA-langlands-2/3:** R23.3 explicitly imports Hilbert Galois representations (R19.2), independent auxiliary-prime lifting (R22.5/R22.6, R21.5/R21.6 as applicable), Hida control (L5), and residual weight inputs (R20.3). KW II Theorem 8.2 has an exact R22.4 request. The export table places auxiliary lifting before residual modularity; the given-lift theorem is a separate branch. No R24.2 premise supplies the KW residual-modularity proof.
2. **/23:** H6 owns the simultaneous twists, pairing/determinant compatibility, components and real/finite local constructions. R23.2 chooses the arithmetic data and applies the exported moduli problem. No obsolete R10 reference remains. Restriction of scalars is requested from A6.
3. **/24:** R23.5 controls fields and transports data; it imports R17.4/R17.6 base change/descent. Descent requires invariance, cuspidality and the supplier's actual hypotheses. Arbitrary intermediate-field descent was removed.
4. **/25:** The three-local-condition theorem treats split opens over `K_v`, unramified invariant opens over `K_v^nr`, and invariant opens over `Kbar_v`. Total reality comes from real places in the split class. Preliminary-field and function-field versions are separately stated.
5. **/26:** CHT 4.1.1 character extension and 4.1.2 soluble prescribed completions are nodes. They import Tau Ceti's ClassFieldTheory layer 12 global existence, allow extra ramification, and feed R23.5. They are not asserted as an unrestricted cyclic Grunwald theorem.
6. **/27:** The exact Chebotarev layer 10 is imported; a Frobenius-generation node and split-prime avoidance argument use it. The pinned Frobenius-prime-set definition is not mistaken for density. Scheme and function-field Chebotarev have separate requests/gaps.
7. **/28:** Snowden's general totally-real residual theorem and BCGP's controlled export are nodes, with A6 restriction of scalars and H6 geometry. KW over Q is an overlap specialization with additional weight/dyadic conclusions. Snowden's auxiliary representation, lifting theorem and independent global-lift/soluble-descent dependencies remain explicit, including a cycle check required before using the latter.
8. **/29:** R24.1 includes the GL2 totally-real ordinary specialization of Thorne 10.2 and the CG ring application. R21.4 supplies ordinary big R=T; R04.6 must supply the finite restriction/polarized CM adapter. The ordinary-local-ring comparison, adequacy and small-image applicability are open, not inferred from absolute irreducibility or ring names.

## Sources and source corrections

The packet's 19 source records retain downloadable URLs, SHA256 hashes, editions, passages read and inherited reading attribution. Copies are not committed. Re-download by those URLs rather than relying on deleted worker scratch files.

The inherited Moret–Bailly I/II, Taylor 2002/2006, KW II and KW Annals routes are retained with corrected ownership and interfaces. Additional passages read cover Qian Proposition 4.2 and disjointness; published CHT 4.1.1–4.1.2; BLGHT 6.2; Bianchi 4.5.1; BHKT §9; published BCGP 9.1.11–9.1.12 and the actual 9.2.7 consumer; Snowden §§3, 5 and 8.1–8.2; Calegari 3.1–3.2; Thorne 10.2; CG Theorem 4.8 and its finiteness paragraph; and Newton–Thorne §3's selected-component/dimension/extraction argument. These are the in-scope passages, not assertions of reading the entire papers. The NT arXiv edition is recorded separately from the 2026 journal publication; the journal version was not collated. Thorne's available author copy is recorded as such.

BHKT's published Acta §9 (pp. 76–79) was collated against the arXiv copy. Its finite-étale Isom scheme in Lemma 9.1 is over the base curve `Y_K`, not over the function field `K`. E8 records this known misprint and Beuzart-Plessis–Harris–Thorne, arXiv:2502.20611v1, p. 28, which explicitly gives the correction. With trivial group the Isom scheme is the curve itself, detecting the incorrect base.

Published BCGP Proposition 9.1.12 (pp. 458–459) contains the impossible disjointness assertion for `L′/E` while `E′ ⊆ L′`, and does not justify descent of its cover to `L/K`. E7 uses the corrected output: `K/E` disjoint from `E′Favoid/E`, `K′=KE′`, and the prescribed Galois cover `L′/K′`, with its local groups taken over `K′`. Lemma 9.2.7 (pp. 462–463) uses these outputs. No descent assertion is reintroduced.

E2–E6 retain their exact editions, excerpts and reasons. The Taylor 2002 determinant correction is already in Taylor 2006 and is used throughout. Skinner–Wiles E11 is an unresolved mathematical dependency, not treated as a harmless source typo.

## Precise follow-up work

The packet's 30 requests are the definitive interface list. They cover R09.3; R19.2/R19.6; R03.4; R17.3–R17.6; R21.4–R21.6; H6/R18.3; A6; R22.4/R22.6; L5; R20.3; R04.6; local L8/R08.2/R08.6; scheme SF.1–SF.4; and the two exact Tau Ceti Chebotarev/global class-field-theory stages. Reuse supplier node ids once their **statements**, rather than only titles, meet these interfaces. Do not reconstruct their objects here.

The 15 gaps specify the following outstanding work:

- Check the relative curve/Picard/Chow/Bertini/Riemann–Roch imports and allocate strong approximation off an omitted place plus the S-unit compact quotient exactly.
- Obtain the Duke Khare Lemmas 2.2 and 4.2 and the two Conrad–Diamond–Taylor inputs; settle the Skinner–Wiles Duke allowable-base-change use and the E11 residual-dihedral obstruction.
- Verify the requested KW II 8.2, Gross/Coleman–Voloch, and R=T-over-F interfaces. Check the proof details omitted in Taylor's local-point lemma/corollary through the H6 and residual suppliers.
- Supply local points at almost all places, arithmetic function-field Chebotarev, finite-group Jordan, and BLGGT 3.1.1's stronger exact-completion/Q-Galois/CM refinement.
- Obtain Moret–Bailly 1990 Theorem 1.2. BHKT 9.3 quotes it; the function-field potential inverse-Galois assertion currently ends in this exact source gap.
- Verify Snowden's independent global-lift/soluble-descent route without introducing a residual-modularity/existence cycle.
- Prove the Thorne polarized-CM/ordinary GL2 and CG ordinary-ring adapters under exact image/local hypotheses, and check the NT selected-component application.
- Supply the integral-closure-to-continuous-local-p-adic-point adapter, residue embedding, localness and formal-smooth framing specialization. The algebraic R03.4 statement alone does not include them.

Compatible-system construction/operations, ACC+23 purity and KW I lifts belong to the next part R24.3–R24.6. Qian Lemma 2.1 belongs to the Dwork Part II. The abelian-surface and BHKT automorphy results remain downstream consumers.

## Validation and Lean limits

`python3 scripts/check_blueprint.py research/blueprint/packets/PotentialModularityAndCompatibleSystems--R23.1.json` reports **0 errors and 0 warnings**. Consistency checks found all 22 API and 16 test names in the suggested file, all implementation statuses unchecked, the planet limit satisfied, and no cycle in the reachable declaration graph of this packet and the available blueprint/integrated suppliers. `git diff --check` passes.

Mathlib's shared build matches `082e2d37e8b0463410cdb532e111cd43d5a66174`. Baseline declarations were read at the pinned commits; Tau Ceti's relevant source blobs match `f790474821cf4256814db967cb154e7af3d0c369`. The shared Tau Ceti checkout is at another commit, and its line-bundle compiled objects are absent. **The complete suggested file was not elaborated:** `lean-check` stops at the missing compiled `TauCeti.AlgebraicGeometry.LineBundle.Class` import.

The complete non-Picard arithmetic portion was separately checked with `lean-check` after removing that import and its Picard block; it elaborated with only proof-hole warnings. This is a limited signature check, not a successful check of the complete file or of mathematical proofs. The file lists omitted completion, geometry, relative Picard, automorphic, deformation and p-adic-topology conditions explicitly. Once the proper pinned compiled dependencies are available, elaborate the full file and resolve its remaining signature omissions against the definitive packet. No library build, cache download, new Lake project or Lean server was started.
