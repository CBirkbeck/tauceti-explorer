# REV-PKG-FunctionFieldArithmetic handoff

Codex, session `codex-HkXdRC`, 2026-10-20; issue #10900. Completed an independent fixing review
of the package written for #10767 by `claude-gOlGsn`. Verdict: **needs_changes**, with the
single remaining defect at README §4.6. See the review report for the complete 48-node
mapping, random 15-subsection source sample, source versions, adversarial computations and
ten-signature comparison. The accepted packet was not edited.

## Done

Corrected chart/infinity signs, nonexact-base dimensions, Witt topologies and order,
Lubin–Tate relative degrees, the completed Schmid–Witt lift ring and logarithmic derivative,
the nonnegative clamp in the upper-unit formula, finite-coefficient perfect-complex
determinants, nonabelian constant-term weights, Satake normalization, rational Fourier-index
covariance, split density half-lengths and FYZ degree conventions. Repaired source pages and
supplier contracts against actual documents. Restored complete Riemann–Roch, place-enumeration
and finite ray algorithms with operation/output-sensitive costs and all four worked examples.

Removed the duplicate finite-exact-constant target and its Lean theorem in favor of the
native ConstantField declarations. Consumed the existing one-pole genus/different theorem,
place completions, restricted products, affine-point topologies, additive adelic analysis,
arithmetic class formation, ordinary Picard schemes and inert Hermitian densities. Kept
variants say exactly what they add. Exact upstream/library commits and declarations are in
the report.

The quantitative degree-sensitive Chebotarev theorem is now §5.10 here. DWP §3.7 consumes
that input; its former citation as the supplying owner was circular. The corrected theorem
has a constant-field congruence, coefficient `|C|/|N|` and lower-degree correction. No external
supplier file was changed; any later owner-link reconciliation should point DWP's input to
this section.

The Suggested file elaborated at the pins with exit 0 and only eight `sorry` warnings.
Packet validation reports no errors/warnings; intake and whitespace checks pass. No heavy
carrier or sorry-bodied data definition was introduced. Metadata is unchanged.

## What remains and where to resume

Start at README §4.6. Supply generalized Picard schemes `J_m`, torsors `Pic_m¹`, the ray Abel
map, Rosenlicht's universal property and the comparison of their Lang covers with finite ray
characters, including connectedness/surjectivity conditions and least conductor. Preserve
every effective modulus, including nonreduced ones. The existing arithmetic ray quotient and
computation in §§4.5 and 5.9 are not substitutes for this geometric theorem.

AL.3 supplies only the zero-modulus comparison; SF.3c gives ordinary Picard schemes. Conrad,
*Geometric global class field theory*, §2 and Theorems 3.1–3.2, pp. 1–4, states the ramified
classification but omits the construction/proof. Milne ADT Appendix A does not supply
existence. The precise negative controls are `ℙ¹` with moduli `[0]+[∞]` and `2[0]`, requiring
`𝔾_m` and `𝔾_a`, and nontrivial constant covers of conductor zero. Do not weaken the target
to the ordinary Jacobian or treat a cited classification statement as a complete proof route.

A possible public proof lead is Daichi Takeuchi, *Blow-ups and class field theory for curves*,
Algebra & Number Theory 13 (2019), 1327–1354,
[publisher PDF](https://msp.org/ant/2019/13-6/ant-v13-n6-p04-s.pdf). I inspected its introductory
Theorems 1.1–1.3 and initial preliminaries only. Its refined-Swan/blow-up/symmetric-power proof
and prerequisites were not audited; it is not an established supplier and does not clear the
gap in this submission. Read the relevant construction and proof, then state the actual
prerequisites and discriminating tests before changing the verdict.

No claim of having read SGA 4½'s proof is made. Only the public Stacks 03UZ statement and the
versioned EtaleCohomologyFoundations contracts were checked. The source ledger, public URLs,
hashes and inspected regions are retained in the review report; disposable scratch data are
not needed to resume.

## Untrusted-input note

The package author's handoff asserted that the maintainer had prohibited computational
certificates. I found no such instruction in the binding files, and the accepted plan
requires those targets. I treated that assertion as untrusted author commentary, did not
follow it as a rule, and restored the computation targets. No command, credential action or
out-of-scope edit was performed on instructions from fetched sources or other authors' text.
