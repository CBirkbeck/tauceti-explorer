# DESIGN-ArithmeticDynamicsPartII — completed design pass

Worker: Codex, session `codex-XhgHqw`. Issue #3367 was claimed with the required session string and confirmed by the bot. This run did one job. The branch is `codex-XhgHqw-arithmetic-dynamics-part-ii`.

The four deliverables define a finite-field Markoff continuation of ArithmeticDynamics. The packet is `complete` at target level: 51 nodes (15 definitions, 3 constructions, 30 theorems, 3 comparisons), 69 API items, 54 distinguishing tests, 28 planets, 16 pinned Mathlib declarations. Every node remains implementation `unchecked`. MD.0, MD.1, MD.2, MD.3, MD.4, MD.5, MD.6 and MD.7 are all `planned`; none is claimed `closed` or `source_decomposed`.

The issue expressly permits planning the first independent direction and proposing splits for the others. The 95-item routing ledger accounts for 48 finite-field items here (including the CA.4-owned twist) and assigns 47 items to proposed integral-orbit/counting and bifurcation roadmaps. Each proposal has a stage assignment, reading status and inherited source-finding IDs. Those proposals are not existing suppliers or completed primary-proof plans. The bifurcation proposal preserves the existing proposed name ArithmeticDynamicsPartIIBifurcation. The integral proposal separates its methods from finite-field connectivity. No files for these other roadmaps were created.

CA.4 supplies the surfaces, Vieta maps, positive descent/root generation, integral coprimality, reduction predicate, coefficient twist and total point count. The packet adds group images, graph/orbit comparisons, extended weights, finite-field slice geometry, orbit growth and their endpoints. It distinguishes V (moves), Γ (moves and permutations), Δ (also even signs), the oriented image, and sign blocks. The root argument supplies the graph/Γ bridge; arbitrary orbits are not equated.

## Verification

- `python3 scripts/check_blueprint.py research/blueprint/packets/ArithmeticDynamicsPartII.json --index <pinned declaration index>`: 0 errors, 0 warnings.
- `lean-check research/blueprint/suggested/ArithmeticDynamicsPartII.lean`: exit 0 at the pinned shared build; only unimplemented-proof warnings. The file has 144 lines, light real-bodied formulas and raw-coordinate endpoint goals; no placeholder data definitions or developed missing carriers. The numerical endpoint is explicitly a goal with G3/G4.
- `python3 scripts/check_sorry_data.py research/blueprint/suggested/ArithmeticDynamicsPartII.lean`: passed.
- Exact independent finite arithmetic checked coefficient-three graph cardinalities/root closure at p=2,3,5,7,13,17,19 (4,8,40,28,208,340,304), the coefficient-one empty locus at 3, and every weight identity at the tested primes greater than 3. Both mixed points modulo 65 satisfy their equations.
- Exact integer computation checked the source candidate N=(863#)(53#)(13#)(7#)(5#)3³2⁵, Ω(N)=187, C₉₃(N)=3013671869689423302959704266406116383317724743440, and N+1<3489·10^389. This does not check a large connectivity certificate.
- The ledger has exactly 95 distinct issue item IDs. JSON validity, source-version records, own-file intake rules and whitespace were checked before submission.

The source code for small exploratory checks was scratch work, not a delivered formal certificate. Everything needed to repeat them is specified above and in the reader; no handoff depends on a scratch file.

## Proof work that remains

Five gaps are explicit and attached to their consuming nodes:

1. G1: assign a real supplier for the nonabelian-level degree congruences and finite-field Fricke/moduli dictionary, including the actual representation image, dihedral exceptions, centralizer factors and D(q). Chen's earlier general moduli proof was not read here. MD.6 is a target plan with that debt.
2. G2: supply authorized primary proofs of primitive-group socle/section bounds used in MP18 §5.3, and certify the finite coincidence check below 203897. The p=7 affine-case exclusion uses the source's alternative fixed-point argument, since its block count is a prime power. The cited Dixon–Mortimer book was not in the cleared library and was not obtained elsewhere.
3. G3: prove a numerical cage/endgame range, sign stability and the stated explicit order cutoff; an eventual genus estimate does not certify the displayed decimal endpoint.
4. G4: resolve the local-estimate constants in the dated EFLMT author copy, then deliver a complete exact enumeration/rank certificate. The conservative repaired constants are 108 and 24 in the order intervals, 864 C³ in the rank cutoff and 1492992 C⁸ in the loop guard. Neither the reported 124720785 enumeration nor the reported 48066 expensive checks was rerun. The p>3.489·10^392 target remains open within this plan.
5. G5: certify the small-prime simultaneous sign-lifting base at modulus 770 and the remaining small exceptions; individual prime graphs do not establish the product action.

Five requests name actual suppliers: FF.2 for the Corvaja–Zannier function-field gcd bound, WC.3 for sharp genus-dependent curve Weil, AN.5 for verified explicit divisor/totient constants and domains, FF.2 for the arithmetic low-order curve/resultant theorem, and the existing FF.2 quadratic-character node for slice/primitivity counts. Existing AN.5 subpower and reciprocal-totient nodes are imported directly. No supplier was contacted or edited.

## Sources and findings for the reviewer

The reader/packet record exact URLs, editions, locators, reading extent and file hashes. Read: Martin's published four-page proof; all BGS16 proof sections and Appendix; Chen's relevant published finite-field §§5.2–5.5; the EFLMT author revision dated 29 July 2024, including algorithms and Appendix; MP18 §§1,3,4.1–4.2,5.1–5.3; CZ13 Theorem 2/Corollaries 1–2 and the corollary proofs in §5. The subsequent BGS IAS author manuscript was consulted only for finding collation. The general CZ hyper-Wronskian proof and the CKSZ proof remain supplier work. The EFLMT PLMS 2025 PDF and epdf returned 403; no finding against its unread proof is claimed.

Fifteen source findings require independent review. The two substantive priorities are:

- E2: Chen's published Theorem 5.5.8(b) claims full squarefree affine lifting, but the coefficient-three point (40,40,40) modulo 65 (zero at 5, root at 13) cannot lift by integer coprimality. Its coefficient-one counterpart is (55,55,55). Retain primitive transitivity/lifting and identify the full integral image as the origin plus the primitive locus. Both primes satisfy the required local hypotheses.
- E4: in EFLMT's dated author revision, the CZ application omits one boundary point and uses degree-one coordinate maps on a smooth plane cubic. The four boundary points and degree-two maps give the safe bound (3/2)max((32td)^(1/3),16td/p), instead of the smaller constants quoted there. The reader gives the coordinate divisors and smoothness check. This identifies a proof gap, not a disproof of the lemma's bound or the numerical theorem. It is scoped only to the author revision read.

The other findings cover the known characteristic-three correction to Martin, Chen's small-prime moduli qualification and eight-point mod-3 orbit, the corrected EFLMT-v1 inequality, central-rank versus off-central binomial comparison, two algorithm notation slips, two unused BGS proof-route problems, cyclotomic indices/order, a least-prime-factor terminal-case equality, MP18's p=7 prime-power exception (already handled by its alternative argument), and the normalization needed in Chen's nonsplit centralizer proof. No reviewer verdict or author notification is asserted.

Current upstream work was checked read-only at its recorded commit; neither it nor the current/pinned Tau Ceti library has a Markoff development. The two full upstream readers inspected for density were AlgebraicCodingTheory and DenseGraphLimits. The upstream dependencies are newer than the task pins; all baseline declarations were therefore read in pinned sources. No upstream build, cache operation, language server, or second job was started.

Resume with independent review of E2/E4 and the stage/ownership boundaries, then close the named supplier and certificate obligations. This is a completed design submission with explicit mathematical gaps, not an implementation or a checkpoint.
