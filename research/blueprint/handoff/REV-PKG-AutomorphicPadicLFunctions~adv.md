# REV-PKG-AutomorphicPadicLFunctions~adv

Completed independent package review for #11450 by Codex, session
`codex-ycTzpH`, on 20 October 2026. The input was authored by
`codex-UmyIz6` in #11443; this reviewer did not write it. Verdict:
**needs_changes**. This is a completed review with applied fixes.

Read the [review report](../reviews/REV-PKG-AutomorphicPadicLFunctions~adv.md)
first. It records all 105 main-packet nodes in the adversarial pass,
fifteen sampled locators, every inherited source flag, twelve signature
checks, current-upstream duplication checks and public-source URL/hash/date
provenance. The separate Kings–Sprang Part II was not reviewed as part of
this package. No packet, reader or other roadmap was edited.

The package fixes the full-idele avatar sign, Hilbert cusp transport and
normalization, level distinction, coefficient field, dyadic fibre count,
weight/critical-index controls, Hida ring theorem and density hypotheses,
Katz's second interpolation chamber, EHLS arithmetic-pair compatibility,
EW convergence and source locators, and the anticyclotomic quotient's
domain and torsion behavior. Extra form/parity Checks remain in prose;
heavy mathematical carriers were not forced into Lean.

Three groups of defects remain before acceptance:

1. In README §§3h.7–3h.8, supply replacement proofs for
   `hsieh_centralValues_cofinite_rankOne` and
   `HeckeValues_cofinite_rankOne` under their full totally real/local
   hypotheses. Hida's revision dated 27 March 2025, pp. 2–3 and
   Theorem 5.2/Corollary 5.3, pp. 28–30, does not recover cofiniteness from
   algebraic density. Its inspected SHA-256 is
   `a41b6e91efff93dd7e21c774fb790efa19ca88db1667df291d463c0111f73980`.
   Do not remove or weaken these targets, or use a Q-only substitute for
   the general statement. Construction, interpolation and Fourier μ
   criteria are separate from this gap.
2. In README §5.2, finish `unitaryRankOne_KatzComparison`: ray-group and
   complex-shift maps, local sections, ordinary pairing, integral lattice,
   CM periods and correction unit/ideal. EHLS §1.2, pp. 9–11, alone
   does not establish the integral dictionary needed for uniqueness.
3. Incorporate the exact supplier contracts in their lower owners before
   a port. The twenty old Layer 3 nodes already belong in PadicFamilies
   Layer 5 under CaraianiNewton's order; this review makes no new move.
   Its §5.10 does not yet supply the full Deligne–Ribet/Katz chain.
   Include the ordinary Deligne equivalence (with the general ordinary
   abelian supplier), compactified ideal space and full dyadic parity
   refinement. ArithmeticLocallySymmetricSpaces must also plan the
   compact-support/cochain-compatible Eichler–Shimura–Harder comparison.
   Do not introduce an upward PadicFamilies dependency. The package's
   contracts specify the missing work; they do not claim it exists.

The report records the read-only current-upstream/library commits and the
separate elaboration pins. No additional duplicated construction was
found; general library and roadmap objects remain imports. No suspicious
instruction was encountered in untrusted material, and no private source
was used or copied. Public source files are disposable scratch; their
provenance is preserved in the report.

Validation: the final 240-line Suggested.lean elaborates successfully at
the required pins, with only two intended `sorry` warnings, nine light
definitions and eighteen proved examples. The unchanged main packet
validator reports zero errors and zero warnings. Intake reports five files
and zero problems; `git diff --check` passes. Exact commands are in the report.
