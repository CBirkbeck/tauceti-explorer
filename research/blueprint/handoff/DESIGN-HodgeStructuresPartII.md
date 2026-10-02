# DESIGN-HodgeStructuresPartII — determinant adapter checkpoint

Agent: Codex — codex-J6LwjP. Refs #3371. Claim 5952774707 confirmed by bot 5952777457; the complete issue was reread afterward. Base 72b8733. Predecessor PR #5747 is the earlier full-file elaboration checkpoint by this session, building on codex-rtOQ9t's intrinsic continuation.

## Delivered

Eight declaration-sized additions: the coordinate determinant connection, its trace coefficient projection, trace-curvature identity, flatness preservation, dual compatibility, tensor rank multiplicities, gauge-curvature invariance, and promotion of the existing gauge-curvature API to its own lemma node. The promoted gauge theorem reuses the existing native signature; there is no duplicate declaration. The construction has three API items and four native tests (rank zero, rank one, scalar rank two, and a flat determinant of a nonflat connection).

The determinant coefficient is trace(A), not det(A). The parameter remains λ, not rank·λ. Tensor coefficients have rank(W)trace(A)+rank(V)trace(B), with ranks cast into the coefficient ring and never inverted. Duals keep the minus sign. Curvature transforms by conjugation, hence the determinant curvature is gauge invariant; the connection coefficient is not asserted unchanged under a nonconstant gauge. Trace loses information, including in positive characteristic.

Totals: 55 nodes — 12 definitions, 16 constructions, 11 theorems, 11 lemmas, 5 comparisons; 103 API items; 89 planned tests; 6 planets; 29 baseline declarations; 10 gaps; 4 requests. All 47 inherited node objects, original APIs/tests, the 149 routed input IDs, historical source/baseline prefixes, source issues and restructuring proposal are preserved. E1's existing request now explicitly includes exterior/determinant carriers. All implementation statuses remain unchecked. H.0 stays partial; H.1–H.8 stay not_read; no stage is closed.

The reserved HodgeStructuresPartII:key/higgs-parameter-connections remains the general mathematical ringed-site definition. These additions are finite free coordinate adapters; they do not construct that general sheaf object or remove its omitted native forms.

## Fresh evidence and edition boundary

Read the parent L0–L3 reviewed audit targets (built/partly built), D3's absent variation scope and E1's partly built scope. No dedicated HodgeStructuresPartII audit row exists. Read the actual CR.1, E1 and DD.1 supplier stage descriptions; screened link-map entries mentioning this roadmap (none asserted) and actual definition layer requirements. Parent HodgeStructures and ReductiveGroups upstream documents were read earlier in this continuous worker run; no fresh whole-document read is claimed.

Published EG20 retrieval returned HTTP 403. Used the author-hosted 44-page preprint at https://www.mi.fu-berlin.de/users/esnault/preprints/helene/126_esn_gro.pdf, whose bytes/pagination differ from the historical published edition. Fresh selected read: §1 p.2 opening fixed-determinant paragraph/Definition 1.1/Remark 1.2; §2.1 pp.5–6 Higgs definitions, trace-zero fixed determinant and Lemma 2.1 with proof; §4.2 pp.23–24 parameter definitions and Lemma 4.9 with its printed proof. No complete version collation, new erratum or correspondence proof is claimed. Existing published/LZ/Heuer receipts and source issues remain historical.

Author PDF SHA-256: 0bfa00b7dbae7a59c193d3523028df826741f15d3e88cb50526f8656a7fb8e35. New formulas are explicit finite algebraic derivations motivated by these source requirements, not separately named source theorems. The eight new excerpts reuse a checked three-word literal.

Fourteen new canonical trace statements were read with their complete hypotheses at Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and checked in the existing pinned declaration index. Derivation.leibniz and its local variables were reread. Existing trace, Kronecker and derivation algebra is imported, never replanned. Pinned Hodge/AG source searches and Mathlib ring/module/exterior searches supplied no competing parameter/determinant-connection carrier in those searched scopes; this is not a universal absence proof.

## Validation

Entire expanded suggested file COMPILED using the existing exact-pin Mathlib build, Lean v4.34.0-rc2: 0 errors, 118 sorry warnings, 0 other warnings; all 48 native examples included. All imports are Mathlib modules, so this does not require or certify a Tau Ceti build. The 35 global nodes, 65 APIs and 54 tests in the omission ledger remain omitted. Admitted signatures are not theorem implementations. One direct Lean process ran at a time; available memory before the final check was 70 GB, runtime 2.27 seconds. No project/cache setup, downloads of library artifacts, library build, language server or background compiler was started.

Suggested SHA-256: df692430d323e907f4a419970dbde6f4a72a6d354f5759a96a1c5a42c7c154e7.
Successful compiler-output SHA-256: b80d7603656e0947d9747150790f767c08eaf021e9fcc846b064b789c708518c.

Indexed blueprint checker: zero errors/zero warnings. Five-file intake and whitespace checks pass. Exact inherited preservation and new reader/native signature/API/example parity pass. Actual read-only atlas assembly with the definition and packet: stage DAG 3022 vertices/8662 edges; combined stage/declaration DAG 3071 vertices/8862 edges. All 18 required layer edges exist, both graphs are acyclic, and no pending or skipped links occur. Six planets stay within the layer cap.

Fresh exact polynomial/Laurent-polynomial models pass over characteristics zero, two and three: 270 pairs of polynomial connection matrices of ranks one through three with parameters 0/1/2; 90 nonconstant Laurent gauge cases. They check trace curvature, dual sign, tensor rank coefficients and curvature, and the derivative correction of the invertible gauge diag(x,1). Each characteristic includes nonzero trace-zero curvature of E12/E21, showing the flat-determinant converse is false. Receipt SHA-256 c6e05c58d20ebdc98bde25972dd8eac496dd858e4a29df031c7c4d0b723eaef4. These regressions are algebraic checks, not universal proofs.

## Resume exactly here

1. Import finite locally free exterior powers and the actual determinant-line carrier/wedge/frame-change coherence from E1. Build the induced alternating parameter operator; prove trace(A) in the chosen top-wedge frame, then the det(G) transition law using the derivation Jacobi formula before descent. The affine curvature invariant alone is insufficient. Fixed determinant requires the specified line connection and its identification; trace zero is not built into every parameter connection.
2. Resolve the precise CR.1 ordinary connection/exterior convention and missing E1 sheaf tensor, finite dual, tensor exactness, pullback and descent interfaces. Resolve DD.1 finite bounded split filtration/Rees fibers. Replace all 35 global omission entries with actual native signatures, APIs and examples, reusing the existing SheafOfModules and locally free carriers.
3. Complete global exterior-power/coefficient-equivariance functoriality and Liu–Zhu's unbounded t-adic filtered-coefficient/graded-base-ring/Tate adapter. A finite split subbundle filtration does not model the unbounded period-ring filtration; a Tate basis cannot erase Galois action. Do not assume rank is invertible when splitting trace-zero endomorphisms.
4. Finish all routed H.0 definitions and nonroutine proof inputs, then H.1–H.8 from their accepted briefs. Import ShimuraData:D3's common variation carrier. H.8 real Noether–Lefschetz is mandatory. Stable moduli, Simpson correspondence, periods, logarithmic degeneration, definability and real applications are not supplied by these coordinate adapters.
5. Continue preserving all eight route-manifest entries, including both legacy DegeneratingHodgeStructures routes. Keep torsion determinant, stability, integral versus complex variation, quasi-nilpotence and boundary assumptions exact. No conjecture becomes an unconditional theorem.

The small scratch directory holds only transient sources, logs and checking scripts; remove it after PR opening. The recorded hashes, scopes, counts and exact continuation instructions above are the durable receipts.
