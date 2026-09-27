# BP-EffectiveDiophantineMethods — first finite-sieve checkpoint

Issue: #1028. Author: Codex — codex-hjdg0j. Claim comment 5855175133; winning bot reply 5855175935. The complete issue was read before claiming and again after the bot confirmed the claim. No preceding packet, reader or suggested file existed in the working snapshot.

## Completed component

Twenty ED.5 nodes: one definition, one construction, eleven lemmas and seven theorems. Nine API items, nine packet tests, nine typed examples, six planets and twenty-eight baseline references. The component uses existing finite sets, additive homomorphisms, image/preimage subgroups and quotient groups. Its dependency graph is acyclic and ends in the pinned baseline. This is closure of the listed finite algebraic component only. The packet remains partial, with nine precise gaps; ED.5 is partial and ED.0–ED.4/ED.6 are not_read. No implementation is claimed.

The nodes specify admissible quotient classes and representative congruences; monotonicity in constraints and local overapproximations; global soundness and the empty-sieve obstruction; initialization with attainable local values; projection under refinement; coset lifting, exact membership and correctness; omission of unchanged local tests; a deterministic cardinality bound; target-preserving prepared subgroups and strict progress; coprime-index coverage of a sieve quotient; and conditional application to commuting maps or unique residue fibres.

The two application theorems take an existing type and actual maps with value-level equalities. They do not manufacture curve or Jacobian objects, and they do not establish the required geometric hypotheses. There is no replacement certificate structure or opaque proposition field. CN.5 retains generic certificate schemas. RS-03, the reviewed audit and the protected elliptic suppliers retain their ownership.

## Sources and a correction

Bruin–Stoll, version of record, LMS J. Comput. Math. 13 (2010), pp.272–280 were read in full, using at most three physical pages per extraction. This covers §§1–3 and §4.1. The May 2009 author copy pp.1–15 was also read; its numbering is not used for published locators. The full paper remains unfinished. The author implementation MWSieve-new.m was read only at LiftInformation lines 2471–2615 and was not executed.

E1 records a literal printed notation defect in PrepareLift on published p.279. With Γ=ℤ, G=ℤ/4 and target 2Γ, taking the original reduction kernel produces 4Γ and violates the required target containment. The correct step uses the kernel after reducing the target modulo the sieve modulus. The authors' implementation already does this. E1 identifies that existing correction, the exact counterexample, version hashes and correction searches; it does not allege a bug in the implementation or a false rational-point theorem. This finding awaits independent review.

BDMTV (2019), published pp.885–887 were freshly read. Its full ED.6 route and all twenty-eight routed items in the existing extraction were read as a worklist. They have not been freshly proved or decomposed here. All algorithm, precision and X_s(13) work remains explicit in the ED.6 gap, including reconciliation of the extraction's eight source findings and the retracted Lemma 4.7. The original campaign sources and the modular-curve sequel also still require full reading.

## Verification

- Blueprint checker: zero errors, one explained index warning. The index writes Finset.Finset.mem_filter, whereas the pinned source and direct Lean check give Finset.mem_filter. Keep the actual name.
- Lean: the final suggested file elaborates against Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and the Tau Ceti f790474821cf4256814db967cb154e7af3d0c369 baseline. It has 35 expected placeholder warnings and no other warnings or errors. The imported closure contains 2,181 Mathlib source files, all byte-verified at the pin; no Tau Ceti implementation module is needed.
- Suggested-file SHA-256: 1a5b9a1007d8850579cc95a2e7b780ef0d8a4f5381d91587dfa824f74b73135e.
- Four temporary proofs were appended only to the authorized suggested file: native quotient congruence membership, exact translated-kernel lifting, the Bézout index-coverage argument and target containment. All elaborated with only standard logical axioms and no placeholder axiom. The probes were removed; no auxiliary Lean file is submitted.
- Independent Python models checked 40,892 finite cyclic configurations, 382,762 refinements, 382,762 omitted-test comparisons, 1,331,656 global-element cases and 23,590 coprime-index cases. They include empty constraints, empty local sets, non-surjective maps, non-subgroup local sets and torsion. Four explicit regressions check the published kernel issue, nonempty coarse survivors without a global solution, unattainable local data and failure of coverage without coprimality. These are mathematical model checks, not execution of the proposed Lean implementation.
- Packet/reader/signature agreement, source-issue schema, native-name checks, dependency closure and the four-file boundary were checked. Intake file checks must pass before submission.

## Resume here

1. Construct and certify ED.5's geometric input data: Jacobian points, the degree-one-class embedding, reduction homomorphisms, complete local images, commutative squares and concrete finite quotient presentations. Import protected EllipticCurves Layer 4 for elliptic reduction. Preserve the explicit conditional status of the two generic map theorems.
2. Finish Bruin–Stoll from published §4.2 through §8 and all cited inputs used. Decompose the actual finite chain/presentation strategy, bad and deep information, genus-two arithmetic and examples. Never infer termination from an expected survivor count. The target D must stay inside every prepared subgroup.
3. Obtain the certified index/saturation outputs from ED.3 and the height or Coleman uniqueness/coverage inputs from ED.2/ED.4. Cover every residual candidate, including torsion and exceptional residue discs.
4. Continue the nine gap entries, respecting RS-03 and current supplier nodes. The Strassmann overlap needs the single-owner resolution recorded by the RT-AUDIT-09 verifier; its draft LV reference is not an established supplier assumption.
5. Read and decompose the BDMTV algorithm and example in full, importing NC.5 theory and CN.5 general schemas. The twenty-eight exact routed item identifiers are retained in the packet's ED.6 gap.

The full twenty-node component and all conventions appear in the reader. Do not mark ED.5 closed on the strength of these finite algebra lemmas.
