# BP-KTheoryLowDegrees--U.1 — the real circle ring is Dedekind

Codex — codex-hjdg0j. Refs #764. Claim 5852901273 was explicitly confirmed by bot 5852902328; the full issue was reread after confirmation. This is a partial continuation of PR #3117, not an independent review or a formalization.

## Delivered and exact closure

Eight new U.3 declarations supply the real-circle Dedekind obligation: six lemmas, one construction and one theorem. The existing carrier A=ℝ[x,y]/(x²+y²−1) is unchanged. The circle relation is Eisenstein in the outer variable at the coefficient prime (Y−1), so its quotient is a domain. For σ²=1 the chart A[(1+σx)⁻¹] is explicitly ℝ[t,(1+t²)⁻¹], by x↦σ(1−t²)/(1+t²), y↦2t/(1+t²), with inverse t↦y/(1+σx). The two chart denominators sum to 2 and cover all primes. Native localization results give Dedekind prime localizations; native local criteria give integral closure and dimension at most one; Noetherianity is supplied directly by existing polynomial and quotient instances. The final theorem supplies the exact IsDedekindDomain predicate.

The separate Dedekind gap is removed, and U.3/U.4 remaining-work lists are narrowed. No stage is closed. The Spin obstruction still needs the requested continuous SL-to-SO retraction. Neither SK₁ nontriviality nor a theorem about arbitrary Dedekind domains is inferred from the algebraic proof alone. The chart at the zero prime is allowed to be a field; no zero-prime DVR claim is made. No assertion says A itself is a PID.

The chart has seven API lemmas and four tests: the two t=0 poles, the t=1 value, agreement with the inverse equivalence, and a wrong y-coordinate scale. A fifth typed test checks the exact final predicate's components. All new prerequisites end in native baseline declarations or other new nodes; the chain has no supplier request.

## Preservation and totals

222 nodes: 16 definitions, 38 constructions, 90 lemmas, 60 theorems, 8 comparisons and 10 applications. There are 437 API items, 230 packet tests, 240 typed examples, 44 planets, 450 baseline citations, 10 source findings, 4 gaps and 9 requests. The checker counts 433 API items and 226 tests on definition/construction nodes; the larger totals include lemma/theorem items.

All 214 inherited IDs survive. Exactly 210 inherited node objects are unchanged. The SK1-real-circle-nonzero node changes only its stale Dedekind-gap prose; its conclusion and requested topological retraction are preserved. The universal Mennicke, SK₁-valued Mennicke and Bass–Milnor–Serre nodes gain the explicit Dedekind dependency for their non-examples. All 425 earlier baseline records, source findings, requests, planets and restructuring proposals are retained. The reader preserves the predecessor content, updates the affected gap/dependency text, and includes every new statement, proof, hypothesis, API and test. Historical Spin verification is explicitly marked historical.

## Read scope and source provenance

The current binding worker/protocol/style documents are byte-identical to the versions read for the immediately preceding job. There is no AGENTS.md in the snapshot. Read all eight reviewed AUDIT-29 scope rows, accepted RS-18 scope/ownership records, the full owner document and atlas scope/edges, and all touching link entries. Read the existing packet inventory, scope, coverage, gaps and requests, and the detailed circle and consuming U.4 contracts. Unchanged Morita, Milnor and arithmetic proof records are inherited evidence, not a fresh full-source audit. Fresh full upstream style reads were JacobianChallenge and Multiquadratic.

Fresh public primary source: Weibel, The K-book, author-hosted draft dated 29 August 2013, https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf, accessed 27 September 2026. Physical pp.191–193 (printed pp.183–185) were read in full in one three-page batch. SHA256 a04f53c9393b20672fab2a6818279b2f9996dbc7cf74735789ed13804b058845. These pages establish the example and arithmetic distinction; the Eisenstein/stereographic proof is the worker's explicit deduction, not a claimed printed proof. No newly discovered source error is asserted. Earlier source findings and version records remain as predecessor evidence.

Twenty-five new indexed baseline statements were read at Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and each source Git blob checked. Already-cited evaluation, quotient and Dedekind declarations were reread. The polynomial Euclidean-domain, PID-to-Dedekind and multivariable UFD instances were also inspected directly. Pinned Mathlib/Tau Ceti and packet searches found no existing algebraic real-circle chart/Dedekind adapter. Generic localization, normality, dimension and polynomial infrastructure is reused, not replanned.

## Verification

The indexed packet checker reports zero errors and zero warnings. Source-finding/version validation passes. The full internal dependency graph is acyclic, with 632 internal edges and 1335 total edges. New reader/signature/API/test parity and exact predecessor-preservation assertions pass.

The entire suggested Lean file compiles with Lean 4.34.0-rc2: zero errors, 741 expected proof-placeholder warnings only. All 8482 reached Mathlib modules were verified against their pinned Git blobs and cache source bytes; all 106 reached Tau Ceti modules were freshly built from pin-verified sources. Seed SHA256 d213bb91d79acbcc33f872c5a840f482513b1af5885b9f760275e454f0ec9bf2. No auxiliary Lean file was created.

Nine formal polynomial identities over exact integer coefficient dictionaries check the chart relation, both inverse-coordinate identities and the characteristic-two square obstruction. There are 4754 exact rational chart cases, including 4752 nonzero overlap parameters with transition t↦1/t. Pole tests and wrong-scale controls pass. These arithmetic checks verify the formulas; they do not constitute a formal proof of the global Dedekind theorem.

The final publication comparison against main caccea9110cda7d3df23faec83c6d7dbf53c3658 checked 50 inputs: no relevant changes or new instructions. Exact-file intake reports four files and zero problems; all eight new IDs are unreserved.

## Resume

The four remaining gap records give the precise contracts:

- The SL-to-SO retraction on coordinate-topologized determinant-one real matrices, fixing the faithful pinned SO carrier in every N≥2. LieGroups layer 9 owns this. Combine it with the inherited Spin endpoint obstruction to finish SK₁ nontriviality; the Dedekind input is now circle-ring-dedekind.
- The tame degree-m Hilbert formula, product formula and power reciprocity for BMS, with the recorded dependency cycle and orientation addressed.
- The higher-unit Hilbert-symbol formula for the totally imaginary BMS case, with its missing source proof and ownership.
- The relative-K₁/homotopy-fibre comparison, retaining the preceding K₂ term and resolving the classical-K₂ dependency cycle.

The nine supplier requests also retain the finite-dimensional Morita map comparison and exact class-field/idele/Chebotarev contracts. Z.1 remains partial for that comparison. The inherited H.3 plus-construction proof boundary remains in U.6 coverage. Preserve left-module K₀, right-module/column K₁, finite sets of finite places for S, the positive DVR boundary, and every existing source correction. The previous detailed handoff is available in PR #3117.
